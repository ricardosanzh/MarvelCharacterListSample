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
            case .sendIdToDetailsScreen(let id):
                self.showCharacterDetail(id: id)
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
    
    func showCharacterDetail(id: Int) {
        let viewController = MarvelCharacterDetailsViewController(factory: AppInjector.MarvelCharacterDetailsInjector(), mainView: MarvelCharacterDetailsView(), dataSource: MarvelCharacterDetailsModel.DataSource(characterId: id))
        self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
