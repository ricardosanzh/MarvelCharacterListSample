//
//  File.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 13/09/2021.
//

import Foundation
struct ItemComic : Codable {
  
  let name : String?
  let resourceURI : String?
  
  enum CodingKeys: String, CodingKey {
    case name = "name"
    case resourceURI = "resourceURI"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
  }
  
}
