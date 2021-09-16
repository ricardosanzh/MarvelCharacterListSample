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
        let characterLastAppearance: String
    }
}
