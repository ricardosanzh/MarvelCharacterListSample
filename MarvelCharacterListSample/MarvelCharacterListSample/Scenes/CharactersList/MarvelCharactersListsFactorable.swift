//

import UIKit

extension AppInjector {
  
  struct MarvelCharactersListsInjector {}
}

extension AppInjector.MarvelCharactersListsInjector: MarvelCharactersListsFactorable {}

protocol MarvelCharactersListsFactorable: MarvelCharactersListsInteractorFactorable, MarvelCharactersListsPresenterFactorable, MarvelCharactersListsRouterFactorable, MarvelCharactersListsServicesFactorable { }

protocol MarvelCharactersListsInteractorFactorable {
  typealias InteractableFactory = MarvelCharactersListsPresenterFactorable & MarvelCharactersListsServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: MarvelCharactersListsDisplayLogic?, dataSource: MarvelCharactersListsModel.DataSource) -> MarvelCharactersListsInteractable
}

protocol MarvelCharactersListsPresenterFactorable {
  func makePresenter(viewController: MarvelCharactersListsDisplayLogic?) -> MarvelCharactersListsPresentationLogic
}

protocol MarvelCharactersListsRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> MarvelCharactersListsRouting
}

extension MarvelCharactersListsFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: MarvelCharactersListsDisplayLogic?, dataSource: MarvelCharactersListsModel.DataSource) -> MarvelCharactersListsInteractable {
    MarvelCharactersListsInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: MarvelCharactersListsDisplayLogic?) -> MarvelCharactersListsPresentationLogic {
    MarvelCharactersListsPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> MarvelCharactersListsRouting {
    MarvelCharactersListsRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol MarvelCharactersListsServicesFactorable {
  
}

extension MarvelCharactersListsServicesFactorable {

}
