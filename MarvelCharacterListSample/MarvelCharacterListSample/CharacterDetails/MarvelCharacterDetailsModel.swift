//
//  MarvelCharacterDetailsModel.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 08/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the VIP Swift Xcode Templates(https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template)
//  so you can apply clean architecture to your iOS and MacOS projects,
//  see more http://clean-swift.com
//


import Foundation

enum MarvelCharacterDetailsModel {
  
  enum Request {
    case doSomething(item: Int)
  }
  
  enum Response {
    case doSomething(newItem: Int, isItem: Bool)
  }
  
  enum ViewModel {
    case doSomething(viewModelData: NSObject)
  }
  
  enum Route {
    case dismissMarvelCharacterDetailsScene
    case xScene(xData: Int)
  }
  
  struct DataSource {
    let characterId: Int
  }
}
