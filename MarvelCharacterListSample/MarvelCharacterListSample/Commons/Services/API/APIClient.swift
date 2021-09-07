//
//  APIClient.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 07/09/2021.
//

import Foundation
import Alamofire

import Foundation
import Alamofire
import Gloss

private struct AccessKeysDictionary {
    let publicKey: String?
    let privateKey: String?
}

class MarvelAPICalls {
    private var keys: NSDictionary?
    private var params: Parameters?
    private let ts = NSDate().timeIntervalSince1970.description
    
    /// Read API Keys from stored property list
    ///
    /// - Returns: A dictionary containing the public key and private kye
    private func getKeys() -> AccessKeysDictionary? {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            self.keys = NSDictionary(contentsOfFile: path)!
        }
        if let data = keys {
            if let privKey = data["PRIVATE_KEY"], let pubKey = data["PUBLIC_KEY"] {
                return AccessKeysDictionary(publicKey: pubKey as? String,
                                            privateKey: privKey as? String)
            } else {
                return AccessKeysDictionary(publicKey: "", privateKey: "")
            }
        } else {
            return AccessKeysDictionary(publicKey: "", privateKey: "")
        }
    }
    
    
    /// Read API characters with its own information.
    ///
    /// - Returns: JSON required for filling this section of the app.
    internal func executeCharacters(limit:Int, offset:Int, completion:  @escaping (_ dataSet: APICharacterReturnDataSet?, _ results: [APICharacterResult]?, _ errorString:String) -> Void) {
        let charactersMarvelURL = UrlManager.shared.getUrlByType(.characters)
        if let dictionary = self.getKeys() {
            if let privKey = dictionary.privateKey, let pubKey = dictionary.publicKey {
                params = [
                    "apikey": pubKey,
                    "ts": ts,
                    "hash": (ts + privKey + pubKey).md5,
                    "limit" : limit,
                    "offset" : offset,
                ]
            } else {
                completion(nil, [], "No correct data sent")
            }
        }
        
        AF.request(charactersMarvelURL, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(_): 
                guard let marvelReturnData = APICharacterReturnDataSet(json: response.value as! JSON) else {
                    print("Error initializating marvel data object")
                    completion(nil, [], "Error initializating marvel data object")
                    return
                }
                guard marvelReturnData.code == 200 else {
                    completion(nil, [], "Error Return Code: \(marvelReturnData.code ?? -1 )")
                    return
                }
                guard let results = marvelReturnData.data?.results else {
                    completion(nil, [], "No data returned")
                    return
                }
                completion(marvelReturnData, results, "No Errors")
            case .failure(let error):
                print(error)
                completion(nil, [], "Service problem detected")
            }
        }
    }
}
