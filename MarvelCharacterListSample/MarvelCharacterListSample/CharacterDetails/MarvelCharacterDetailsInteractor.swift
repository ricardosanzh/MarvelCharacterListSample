//

import Foundation

typealias MarvelCharacterDetailsInteractable = MarvelCharacterDetailsBusinessLogic & MarvelCharacterDetailsDataStore

protocol MarvelCharacterDetailsBusinessLogic {
    
    func doRequest(_ request: MarvelCharacterDetailsModel.Request)
}

protocol MarvelCharacterDetailsDataStore {
    var dataSource: MarvelCharacterDetailsModel.DataSource { get }
}

final class MarvelCharacterDetailsInteractor: MarvelCharacterDetailsDataStore {
    
    var dataSource: MarvelCharacterDetailsModel.DataSource
    
    private var factory: MarvelCharacterDetailsInteractorFactorable.InteractableFactory
    private var presenter: MarvelCharacterDetailsPresentationLogic
    
    init(factory: MarvelCharacterDetailsInteractorFactorable.InteractableFactory, viewController: MarvelCharacterDetailsDisplayLogic?, dataSource: MarvelCharacterDetailsModel.DataSource) {
        self.factory = factory
        self.dataSource = dataSource
        self.presenter = factory.makePresenter(viewController: viewController)
    }
}


// MARK: - MarvelCharacterDetailsBusinessLogic
extension MarvelCharacterDetailsInteractor: MarvelCharacterDetailsBusinessLogic {
    
    func doRequest(_ request: MarvelCharacterDetailsModel.Request) {
        DispatchQueue.global(qos: .userInitiated).async {
            switch request {
            case .extractCharacterDetails:
                self.getCharacterDetail()
            }
        }
    }
}


// MARK: - Private Zone
private extension MarvelCharacterDetailsInteractor {
    
    func getCharacterDetail() {
        LoaderView.toggleUniversalLoadingView(true)
        APIClient().getCharacterDetail(id: dataSource.characterId) { (result, _) in
            LoaderView.toggleUniversalLoadingView(false)
            if let res = result {
                self.presenter.presentResponse(.presentCharacterDetails(resultDetails: res))

            }
        }
    }
}
