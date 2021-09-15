//
//  Comic.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 13/09/2021.
//

import Foundation

struct Comic : Codable {
  let available : Int?
  let collectionURI : String?
  let returned : Int?
  let items : [ItemComic]?
  
  enum CodingKeys: String, CodingKey {
    case available = "available"
    case collectionURI = "collectionURI"
    case returned = "returned"
    case items = "items"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    available = try values.decodeIfPresent(Int.self, forKey: .available)
    collectionURI = try values.decodeIfPresent(String.self, forKey: .collectionURI)
    returned = try values.decodeIfPresent(Int.self, forKey: .returned)
    items = try values.decodeIfPresent([ItemComic].self, forKey: .items)
  }
  
}
