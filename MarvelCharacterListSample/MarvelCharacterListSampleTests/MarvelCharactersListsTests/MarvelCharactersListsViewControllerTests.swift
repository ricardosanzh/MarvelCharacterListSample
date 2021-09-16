//

import XCTest
@testable import MarvelCharacterListSample


final class MarvelCharactersListsViewControllerTests: XCTestCase {
    
    private var interactor: MarvelCharactersListsInteractorSpy!
    private var viewController: MarvelCharactersListsViewController!
    private var router: MarvelCharactersListsRouterSpy!
    
    override func setUp() {
        viewController = MarvelCharactersListsViewController(factory: self,
                                                             mainView: MarvelCharactersListsView(),
                                                             dataSource: MarvelCharactersListsModel.DataSource())
    }
    
    override func tearDown() {
        interactor = nil
        viewController = nil
        router = nil
    }
}



// MARK: - Tests
extension MarvelCharactersListsViewControllerTests {
    
    func testShowDetail() {
        router.showDetailExpectation = expectation(description: "showDetailExpectation")
        let testId = 500
        viewController.displayViewModel(.showCharacterDetailsInVC(id: 500))
        wait(for: [router.showDetailExpectation], timeout: 0.1)
        XCTAssertEqual(testId, router.passedId)
    }
    
    func testShowCharactersListInVC() {
        let testViewData = MarvelCharactersListsModel.ViewDataSource(title: "Title", items: [])
        viewController.displayViewModel(.showCharactersListInVC(viewModelData: testViewData))
    }
}


// MARK: - LoginFactorable, Injector
extension MarvelCharactersListsViewControllerTests: MarvelCharactersListsFactorable {
    
    func makeInteractor(factory: InteractableFactory,
                        viewController: MarvelCharactersListsDisplayLogic?,
                        dataSource: MarvelCharactersListsModel.DataSource) -> MarvelCharactersListsInteractable {
        interactor = MarvelCharactersListsInteractorSpy(dataSource: dataSource)
        return interactor
    }
    
    func makeRouter(viewController: UIViewController?) -> MarvelCharactersListsRouting {
        router = MarvelCharactersListsRouterSpy()
        return router
    }
}

// MARK: - Spy Classes Setup
private extension MarvelCharactersListsViewControllerTests {
    
    final class MarvelCharactersListsInteractorSpy: MarvelCharactersListsInteractable {
        var dataSource: MarvelCharactersListsModel.DataSource
        
        var passedIndex: Int!
        var passedPage: Int!
        
        init(dataSource: MarvelCharactersListsModel.DataSource) {
            self.dataSource = dataSource
        }
        
        func doRequest(_ request: MarvelCharactersListsModel.Request) {
            
            switch request {
            case let .characterSelected(index):
                passedIndex = index
                
            case let .extractCharactersList(page):
                passedPage = page
            }
        }
    }
    
    final class MarvelCharactersListsRouterSpy: MarvelCharactersListsRouting {
        var passedId: Int!
        var showDetailExpectation: XCTestExpectation!
        
        func routeTo(_ route: MarvelCharactersListsModel.Route) {
            
            switch route {
            case let .sendIdToDetailsScreen(id):
                passedId = id
                showDetailExpectation.fulfill()
                
            }
        }
    }
}
