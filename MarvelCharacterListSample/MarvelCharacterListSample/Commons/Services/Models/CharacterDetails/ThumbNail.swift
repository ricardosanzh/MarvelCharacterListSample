//
//  ThumbNail.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 13/09/2021.
//

import Foundation

struct Thumbnail : Codable {
  let exten : String?
  let path : String?
  
  enum CodingKeys: String, CodingKey {
    case exten = "extension"
    case path = "path"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    exten = try values.decodeIfPresent(String.self, forKey: .exten)
    path = try values.decodeIfPresent(String.self, forKey: .path)
  }
  
}
