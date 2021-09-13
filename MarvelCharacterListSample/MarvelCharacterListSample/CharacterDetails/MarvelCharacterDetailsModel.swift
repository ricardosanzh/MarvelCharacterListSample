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
    
    //Interactor
    enum Request {
        case extractCharacterDetails
    }
    
    //Presenter
    enum Response {
        case presentCharacterDetails(resultDetails: ResultList)
    }
    
    enum ViewModel {
        case showDetailsInVC(viewModelData: ViewDataSource)
    }
    
    enum Route {

    }
    
    struct DataSource {
        let characterId: Int
    }

    struct ViewDataSource {
        let imageName: String?
        let characterDescription: String
        let characterName: String
    }
}
