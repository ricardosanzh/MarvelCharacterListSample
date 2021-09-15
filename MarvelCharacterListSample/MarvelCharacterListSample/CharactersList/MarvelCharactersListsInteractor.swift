//

import Foundation

typealias MarvelCharactersListsInteractable = MarvelCharactersListsBusinessLogic & MarvelCharactersListsDataStore

protocol MarvelCharactersListsBusinessLogic {
    func doRequest(_ request: MarvelCharactersListsModel.Request)
}

protocol MarvelCharactersListsDataStore {
    var dataSource: MarvelCharactersListsModel.DataSource { get }
}

final class MarvelCharactersListsInteractor: MarvelCharactersListsDataStore {
    
    var dataSource: MarvelCharactersListsModel.DataSource
    
    private var factory: MarvelCharactersListsInteractorFactorable.InteractableFactory
    private var presenter: MarvelCharactersListsPresentationLogic
    
    init(factory: MarvelCharactersListsInteractorFactorable.InteractableFactory, viewController: MarvelCharactersListsDisplayLogic?, dataSource: MarvelCharactersListsModel.DataSource) {
        self.factory = factory
        self.dataSource = dataSource
        self.presenter = factory.makePresenter(viewController: viewController)
    }
}


// MARK: - MarvelCharactersListsBusinessLogic
extension MarvelCharactersListsInteractor: MarvelCharactersListsBusinessLogic {
    
    func doRequest(_ request: MarvelCharactersListsModel.Request) {
        DispatchQueue.global(qos: .userInitiated).async {
            switch request {
            case .extractCharactersList(let page):
                self.getCharactersList(page: page)
            case .characterSelected(let selectedCharacterIndex):
                if let id = self.dataSource.charactersList[selectedCharacterIndex].id {
                    self.presenter.presentResponse(.presentCharacterDetails(id: id))
                }
            }
        }
    }
}


// MARK: - Private Zone
private extension MarvelCharactersListsInteractor {
    func getCharactersList(page: Int) {
        if page == 0 {
            LoaderView.toggleUniversalLoadingView(true)
        }
        APIClient().executeCharacters(page: page) {
            (results: CharactersList?, error: String) in
            LoaderView.toggleUniversalLoadingView(false)
            if let resultsReceived = results {
                if let res = resultsReceived.data?.results {
                    self.dataSource.charactersList.append(contentsOf: res)
                    self.presenter.presentResponse(.presentCharactersListResponse(self.dataSource.charactersList))
                }
            }
        }
    }
}
