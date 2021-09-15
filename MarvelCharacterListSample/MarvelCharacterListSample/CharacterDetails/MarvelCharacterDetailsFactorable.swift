//

import UIKit

extension AppInjector {
  
  struct MarvelCharacterDetailsInjector {}
}

extension AppInjector.MarvelCharacterDetailsInjector: MarvelCharacterDetailsFactorable {}

protocol MarvelCharacterDetailsFactorable: MarvelCharacterDetailsInteractorFactorable, MarvelCharacterDetailsPresenterFactorable, MarvelCharacterDetailsRouterFactorable, MarvelCharacterDetailsServicesFactorable { }

protocol MarvelCharacterDetailsInteractorFactorable {
  typealias InteractableFactory = MarvelCharacterDetailsPresenterFactorable & MarvelCharacterDetailsServicesFactorable
  
  func makeInteractor(factory: InteractableFactory, viewController: MarvelCharacterDetailsDisplayLogic?, dataSource: MarvelCharacterDetailsModel.DataSource) -> MarvelCharacterDetailsInteractable
}

protocol MarvelCharacterDetailsPresenterFactorable {
  func makePresenter(viewController: MarvelCharacterDetailsDisplayLogic?) -> MarvelCharacterDetailsPresentationLogic
}

protocol MarvelCharacterDetailsRouterFactorable {
  func makeRouter(viewController: UIViewController?) -> MarvelCharacterDetailsRouting
}

extension MarvelCharacterDetailsFactorable {
  
  func makeInteractor(factory: InteractableFactory, viewController: MarvelCharacterDetailsDisplayLogic?, dataSource: MarvelCharacterDetailsModel.DataSource) -> MarvelCharacterDetailsInteractable {
    MarvelCharacterDetailsInteractor(factory: factory, viewController: viewController, dataSource: dataSource)
  }
  
  func makePresenter(viewController: MarvelCharacterDetailsDisplayLogic?) -> MarvelCharacterDetailsPresentationLogic {
    MarvelCharacterDetailsPresenter(viewController: viewController)
  }
  
  func makeRouter(viewController: UIViewController?) -> MarvelCharacterDetailsRouting {
    MarvelCharacterDetailsRouter(viewController: viewController)
  }
}


// MARK: - Service Factorable
protocol MarvelCharacterDetailsServicesFactorable {
  
}

extension MarvelCharacterDetailsServicesFactorable {

}
