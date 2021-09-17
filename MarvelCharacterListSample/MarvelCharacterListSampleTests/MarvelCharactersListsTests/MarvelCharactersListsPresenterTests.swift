//

import XCTest
@testable import MarvelCharacterListSample


final class MarvelCharactersListsPresenterTests: XCTestCase {
    
    private var presenter: MarvelCharactersListsPresenter!
    private var viewController: MarvelCharactersListsViewControllerSpy!
    
    override func setUp() {
        viewController = MarvelCharactersListsViewControllerSpy()
        presenter = MarvelCharactersListsPresenter(viewController: viewController)
    }
    
    override func tearDown() {
        viewController = nil
        presenter = nil
    }
}


// MARK: - Tests
extension MarvelCharactersListsPresenterTests {
    func testShowDetail() {
      XCTAssertNil(viewController.passedId)
      let testId = 1011334
      presenter.presentResponse(.presentCharacterDetails(id: testId))
      XCTAssertEqual(viewController.passedId, testId)
    }
    

    func testCharactersList() {
      XCTAssertNil(viewController.passedList)
        if let path = Bundle.main.path(forResource: "charactersList", ofType: "json") {
            if let data = FileManager.default.contents(atPath: path) {
            let decoder = JSONDecoder()
            do {
              if let dataList = try decoder.decode(CharactersList.self, from: data).data, let testList = dataList.results {
                presenter.presentResponse(.presentCharactersListResponse(testList))
                XCTAssertEqual(viewController.passedList.items.count, testList.count)
              }
            } catch {
              fatalError(error.localizedDescription)
            }
          }
        }
    }
}


// MARK: - Spy Classes Setup
private extension MarvelCharactersListsPresenterTests {
    
    final class MarvelCharactersListsViewControllerSpy: UIViewController, MarvelCharactersListsDisplayLogic {
        
        var passedList: MarvelCharactersListsModel.ViewDataSource!
        var passedId: Int!
        
        func displayViewModel(_ viewModel: MarvelCharactersListsModel.ViewModel) {
            
            switch viewModel {
            case let .showCharactersListInVC(viewModelData):
                passedList = viewModelData
                
            case let .showCharacterDetailsInVC(id):
                passedId = id
                
            }
        }
    }
}
