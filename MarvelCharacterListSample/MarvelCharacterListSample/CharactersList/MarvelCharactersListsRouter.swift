//
//  MarvelCharactersListsRouter.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 03/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol MarvelCharactersListsRouting {
  
  func routeTo(_ route: MarvelCharactersListsModel.Route)
}

final class MarvelCharactersListsRouter {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - MarvelCharactersListsRouting
extension MarvelCharactersListsRouter: MarvelCharactersListsRouting {
  
  func routeTo(_ route: MarvelCharactersListsModel.Route) {
    DispatchQueue.main.async {
      switch route {
        
      case .dismissMarvelCharactersListsScene:
        self.dismissMarvelCharactersListsScene()
        
      case .xScene(let data):
        self.showXSceneBy(data)
      }
    }
  }
}


// MARK: - Private Zone
private extension MarvelCharactersListsRouter {
  
  func dismissMarvelCharactersListsScene() {
    viewController?.dismiss(animated: true)
  }
  
  func showXSceneBy(_ data: Int) {
    print("will show the next screen")
  }
}