//

import Foundation

enum MarvelCharactersListsModel {
    
    //Interactor
    enum Request {
        case extractCharactersList(page: Int)
        case characterSelected(selected: Int)
    }
    
    //Presenter
    enum Response {
        case presentCharactersListResponse([APICharacterResult])
        case presentCharacterDetails(id: Int)

    }
    
    //Info
    enum ViewModel {
        case showCharactersListInVC(viewModelData: ViewDataSource)
        case showCharacterDetailsInVC(id: Int)
    }
    
    struct ViewDataSource {
        let title: String?
        let items: [CharactersCellModel]
    }
    
    enum Route {
        case sendIdToDetailsScreen(id: Int)
    }
    
    struct DataSource {
      var charactersList: [APICharacterResult] = []
    }
    
    struct CharactersCellModel {
        let charecterName: String
        let characterImage: String?
    }
}
