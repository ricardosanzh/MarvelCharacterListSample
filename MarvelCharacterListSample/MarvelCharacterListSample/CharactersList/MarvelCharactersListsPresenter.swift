//
//  MarvelCharactersListsPresenter.swift
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

protocol MarvelCharactersListsPresentationLogic {
    func presentResponse(_ response: MarvelCharactersListsModel.Response)
}

final class MarvelCharactersListsPresenter {
    private weak var viewController: MarvelCharactersListsDisplayLogic?
    
    init(viewController: MarvelCharactersListsDisplayLogic?) {
        self.viewController = viewController
    }
}


// MARK: - MarvelCharactersListsPresentationLogic
extension MarvelCharactersListsPresenter: MarvelCharactersListsPresentationLogic {
    
    func presentResponse(_ response: MarvelCharactersListsModel.Response) {
        switch response {
        case .presentCharactersListResponse(let characters):
            presentCharactersList(characters)
            
        case .doSomething(let theNewItem, let isItem):
            presentDoSomething(theNewItem, isItem)
            
        }
    }
}

// MARK: - Private Zone
private extension MarvelCharactersListsPresenter {
    func presentCharactersList(_ characters: [APICharacterResult]) {
        print(characters)
        
        let title = "Characters List"
        var items: [MarvelCharactersListsModel.CharactersCellModel] = []
        
        for character in characters {
            var imageName: String?
            if let thumbnail = character.thumbnail, let path = thumbnail.path, let ext = thumbnail.fileExtension {
                imageName = path + "." + ext
            }
            if let name = character.name {
                let item = MarvelCharactersListsModel.CharactersCellModel(charecterName: name, characterImage: imageName)
                items.append(item)
            }
        }
        self.viewController?.displayViewModel(.showCharactersListInVC(viewModelData: MarvelCharactersListsModel.ViewDataSource(title: title, items: items)))
    }
    
    func presentDoSomething(_ newItem: Int, _ isItem: Bool) {
        viewController?.displayViewModel(.doSomething(viewModelData: NSObject()))
    }
}
