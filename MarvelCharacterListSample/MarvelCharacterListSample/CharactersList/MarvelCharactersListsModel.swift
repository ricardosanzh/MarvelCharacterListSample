//
//  MarvelCharactersListsModel.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 03/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//


import Foundation

enum MarvelCharactersListsModel {
    
    //Interactor
    enum Request {
        case doSomething(item: Int)
    }
    
    //Presenter
    enum Response {
        case doSomething(newItem: Int, isItem: Bool)
    }
    
    //Info
    enum ViewModel {
        case doSomething(viewModelData: NSObject)
    }
    
    struct ViewDataSource {
    }
    
    enum Route {
        case dismissMarvelCharactersListsScene
        case xScene(xData: Int)
    }
    
    struct DataSource {
//      var characterList: [ResultList] = []
    }
    
    struct CharactersCellModel {
        let charecterName: String
        let characterImage: String?
    }
}