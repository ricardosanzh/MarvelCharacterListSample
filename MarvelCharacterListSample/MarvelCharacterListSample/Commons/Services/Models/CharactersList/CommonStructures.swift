//
//  CommonStructures.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 07/09/2021.
//

import Foundation
import Gloss

public struct APIImageResult: JSONDecodable {
    public let fileExtension: String?
    private var _path: String!
    public var path: String? {
        return self.securePath(path: _path)
    }
    
    public var url: URL? {
        if let exten = self.fileExtension {
            return URL(string: self.securePath(path: self._path) + "." + exten)
        }
        return nil
    }
    
    func securePath(path:String) -> String {
        if path.hasPrefix("http://") {
            let range = path.range(of: "http://")
            var newPath = path
            newPath.removeSubrange(range!)
            return "https://" + newPath
        } else {
            return path
        }
    }
    
    public init?(json:JSON) {
        self._path = "path" <~~ json
        self.fileExtension = "extension" <~~ json
    }
}
