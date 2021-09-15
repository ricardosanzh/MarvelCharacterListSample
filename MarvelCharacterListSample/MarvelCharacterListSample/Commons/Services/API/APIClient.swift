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

private struct AccessKeysDictionary {
    let publicKey: String?
    let privateKey: String?
}

class APIClient {
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
    internal func executeCharacters(page: Int, completion:  @escaping (_ results: CharactersList?, _ errorString:String) -> Void) {
        let limit = 10
        let offset = limit * page
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
                completion(nil, "No correct data sent")
            }
        }
        
        AF.request(charactersMarvelURL, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let charactersList = try JSONDecoder().decode(CharactersList.self, from: data)
                        if let code = charactersList.code {
                            if code == 200 {
                                completion(charactersList, "No errors")
                            }
                        }
                    } catch {
                        completion(nil, "json problem detected")
                    }
                }
                
            case .failure(let error):
                print(error)
                completion(nil, "Service problem detected")
            }
        }
    }
    
    internal func getCharacterDetail(id: Int, completion:  @escaping (_ results: ResultList?, _ errorString:String) -> Void) {
        
        let charactersMarvelURL = UrlManager.shared.getUrlByType(.charactersDescription) + "\(id)"
        if let dictionary = self.getKeys() {
            if let privKey = dictionary.privateKey, let pubKey = dictionary.publicKey {
                params = [
                    "apikey": pubKey,
                    "ts": ts,
                    "hash": (ts + privKey + pubKey).md5,
                ]
            }
        }
        
        AF.request(charactersMarvelURL, method: .get, parameters: params).responseJSON { (response) in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let charactersList = try JSONDecoder().decode(CharactersList.self, from: data)
                        if let code = charactersList.code {
                            if code == 200 {
                                if let characterSelected = charactersList.data?.results?.first {
                                    completion(characterSelected, "No errors")
                                }
                            }
                        }
                    } catch {
                        completion(nil, "json problem detected")
                    }
                }
                
            case .failure(let error):
                print(error)
                completion(nil, "Service problem detected")
                
            }
        }
    }
}
