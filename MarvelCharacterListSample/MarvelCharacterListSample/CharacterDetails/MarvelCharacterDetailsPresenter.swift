//

import Foundation

protocol MarvelCharacterDetailsPresentationLogic {
    func presentResponse(_ response: MarvelCharacterDetailsModel.Response)
}

final class MarvelCharacterDetailsPresenter {
    private weak var viewController: MarvelCharacterDetailsDisplayLogic?
    
    init(viewController: MarvelCharacterDetailsDisplayLogic?) {
        self.viewController = viewController
    }
}


// MARK: - MarvelCharacterDetailsPresentationLogic
extension MarvelCharacterDetailsPresenter: MarvelCharacterDetailsPresentationLogic {
    
    func presentResponse(_ response: MarvelCharacterDetailsModel.Response) {
        
        switch response {
        case .presentCharacterDetails(let resultDetails):
            self.presentDetails(resultDetails: resultDetails)
        }
    }
}


// MARK: - Private Zone
private extension MarvelCharacterDetailsPresenter {
    
    func presentDetails(resultDetails: ResultList) {
        var imageName: String?
        if let thumbnail = resultDetails.thumbnail, let path = thumbnail.path, let exten = thumbnail.exten {
            imageName = path + "." + exten
            
        }
        
        var characterName: String?
        var characterDescription: String?
        if let name = resultDetails.name, let description = resultDetails.descriptionField {
            characterName = name
            characterDescription = description
            
            if name.isEmpty {
                characterName = Constants.Default.noNameAvailable
            }
            if description.isEmpty {
                characterDescription = Constants.Default.noDescriptionAvailable
            }
        }

        var lastCharacterAppearance: String?
        if let lastAppearance = resultDetails.comics?.items?.first?.name {
            lastCharacterAppearance = lastAppearance
            
            if lastAppearance.isEmpty {
                lastCharacterAppearance = Constants.Default.noComicsAvailable
            }
        }
        
        let characterModel = MarvelCharacterDetailsModel.ViewDataSource(
            imageName: imageName,
            characterDescription: characterDescription ?? Constants.Default.noDescriptionAvailable,
            characterName: characterName ?? Constants.Default.noNameAvailable,
            characterLastAppearance: lastCharacterAppearance ?? Constants.Default.noComicsAvailable
        )
        
        self.viewController?.displayViewModel(.showDetailsInVC(viewModelData: characterModel))
    }
}
