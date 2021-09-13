//
//  CharactersList.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 07/09/2021.
//

import Foundation
import Gloss

//MARK: - Characters section.
public struct APICharacterReturnDataSet: JSONDecodable {
    public let code: Int?
    public let status: String?
    public let attributionText: String?
    public let data: APICharacterData?
    
    //Deserialization
    public init?(json: JSON) {
        self.code = "code" <~~ json
        self.status = "status" <~~ json
        self.attributionText = "attributionText" <~~ json
        self.data = "data" <~~ json
    }
}

public struct APICharacterData: JSONDecodable {
    public let offset: Int?
    public let limit: Int?
    public let total: Int?
    public let count: Int?
    public let results: [APICharacterResult]?
    
    //Deserialization
    public init?(json: JSON) {
        self.offset = "offset" <~~ json
        self.limit = "limit" <~~ json
        self.total = "total" <~~ json
        self.count = "count" <~~ json
        self.results = "results" <~~ json
    }
}

public struct APICharacterResult: JSONDecodable {
    
    public let id: Int?
    public let name: String?
    public let description: String?
    public let thumbnail: APIImageResult?
    public let comics: [APICharacterComicsResult]?
    
    public init?(json: JSON) {
        
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.description = "description" <~~ json
        self.thumbnail = "thumbnail" <~~ json
        self.comics = "comics" <~~ json
    }
}

public struct APICharacterComicsResult: JSONDecodable {
    public let available: Int?
    public let returned: Int?
    public let collectionURI: String?
    public let items: [APICharacterComicSummary]?
    
    enum CodingKeys: String, CodingKey {
      case available = "available"
      case returned = "returned"
      case collectionURI = "collectionURI"
      case items = "items"

    }
    
    public init?(json: JSON) {
        self.available = "available" <~~ json
        self.returned = "name" <~~ json
        self.collectionURI = "collectionURI" <~~ json
        self.items = "items" <~~ json
    }
}

public struct APICharacterComicSummary: JSONDecodable {
    public let resourceURI: String?
    public let name: String?
    
    enum CodingKeys: String, CodingKey {
      case resourceURI = "resourceURI"
      case name = "name"

    }
    
    public init?(json: JSON) {
        self.resourceURI = "resourceURI" <~~ json
        self.name = "name" <~~ json
    }
}
