//
//  URLManager.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 07/09/2021.
//

import Foundation

enum UrlType{
    case characters
    
    func getUrlName() -> String {
        switch self {
        case .characters: return "charactersUrl"
        }
    }
}

class UrlManager {
    static let shared = UrlManager()
    
    init() {}
    
    func getUrlByType(_ type : UrlType) -> String {
        guard let urlBase = Bundle.main.object(forInfoDictionaryKey: "urlBase") as? String else {
            return ""
        }
        let dictionaryName: String = "url"
        guard let urlDictionary = Bundle.main.object(forInfoDictionaryKey: dictionaryName) as? Dictionary<String, String> else {
            return ""
        }
        guard let url = urlDictionary[type.getUrlName()] else {
            return ""
        }
        let marvelURL = urlBase + url
        return marvelURL
    }
    
}
