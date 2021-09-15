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
        case .presentCharacterDetails(let characterId):
            self.viewController?.displayViewModel(.showCharacterDetailsInVC(id: characterId))
        }
    }
}

// MARK: - Private Zone
private extension MarvelCharactersListsPresenter {
    func presentCharactersList(_ characters: [APICharacterResult]) {
        
        let title = Constants.Titles.charactersListScreen
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
}
