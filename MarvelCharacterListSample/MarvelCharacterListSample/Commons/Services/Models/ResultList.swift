//
//  Result.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 13/09/2021.
//

import Foundation

struct ResultList : Codable {
  
  let comics : Comic?
  let descriptionField : String?
  let id : Int?
  let modified : String?
  let name : String?
  let resourceURI : String?
  let thumbnail : Thumbnail?
  
  enum CodingKeys: String, CodingKey {
    case comics = "comics"
    case descriptionField = "description"
    case id = "id"
    case modified = "modified"
    case name = "name"
    case resourceURI = "resourceURI"
    case thumbnail = "thumbnail"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    comics = try values.decode(Comic.self, forKey: .comics)
    descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
    id = try values.decodeIfPresent(Int.self, forKey: .id)
    modified = try values.decodeIfPresent(String.self, forKey: .modified)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    resourceURI = try values.decodeIfPresent(String.self, forKey: .resourceURI)
    thumbnail = try values.decode(Thumbnail.self, forKey: .thumbnail)
  }
  
}
