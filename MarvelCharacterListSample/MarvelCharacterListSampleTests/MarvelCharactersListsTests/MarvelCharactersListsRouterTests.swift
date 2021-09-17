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
    func testRouter() {
        let testId = 1011334
        router.routeTo(.sendIdToDetailsScreen(id: testId))
    }
}


// MARK: - Spy Classes Setup
private extension MarvelCharactersListsRouterTests {

  final class MarvelCharactersListsViewControllerSpy: UIViewController {
    var passedId: Int!

    var dismissExpectation: XCTestExpectation!
    var isDismissed: Bool = false

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
      isDismissed = true
      dismissExpectation.fulfill()
    }
  }
}
