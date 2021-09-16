//

import XCTest
@testable import MarvelCharacterListSample


final class MarvelCharactersListsRouterTests: XCTestCase {
  
  private var router: MarvelCharactersListsRouter!
  private var viewController: MarvelCharactersListsViewControllerSpy!

  override func setUp() {
    viewController = MarvelCharactersListsViewControllerSpy()
    router = MarvelCharactersListsRouter(viewController: viewController)
  }

  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension MarvelCharactersListsRouterTests {


}


// MARK: - Spy Classes Setup
private extension MarvelCharactersListsRouterTests {

  final class MarvelCharactersListsViewControllerSpy: UIViewController {
    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      dismissExpectation.fulfill()
    }
  }
}
