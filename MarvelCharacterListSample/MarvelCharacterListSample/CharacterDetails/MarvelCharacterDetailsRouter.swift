//

import UIKit

protocol MarvelCharacterDetailsRouting {
  
  func routeTo(_ route: MarvelCharacterDetailsModel.Route)
}

final class MarvelCharacterDetailsRouter {
  
  private weak var viewController: UIViewController?
  
  init(viewController: UIViewController?) {
    self.viewController = viewController
  }
}


// MARK: - MarvelCharacterDetailsRouting
extension MarvelCharacterDetailsRouter: MarvelCharacterDetailsRouting {
  
  func routeTo(_ route: MarvelCharacterDetailsModel.Route) {

    
  }
}


// MARK: - Private Zone
private extension MarvelCharacterDetailsRouter {
  
}
