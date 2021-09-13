//
//  MarvelCharacterDetailsRouter.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 08/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//

import UIKit

protocol MarvelCharacterDetailsRouting {
  
  func routeTo(_ route: MarvelCharacterDetailsModel.Route)
}

final class MarvelCharacterDetailsRouter {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - MarvelCharacterDetailsRouting
extension MarvelCharacterDetailsRouter: MarvelCharacterDetailsRouting {
  
  func routeTo(_ route: MarvelCharacterDetailsModel.Route) {
//    DispatchQueue.main.async {
//      switch route {
//
//      }
//    }
  }
}


// MARK: - Private Zone
private extension MarvelCharacterDetailsRouter {
  
  func dismissMarvelCharacterDetailsScene() {
    viewController?.dismiss(animated: true)
  }
  
  func showXSceneBy(_ data: Int) {
    print("will show the next screen")
  }
}
