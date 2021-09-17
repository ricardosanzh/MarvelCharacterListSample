//

import XCTest
@testable import MarvelCharacterListSample


final class MarvelCharactersListsInteractorTests: XCTestCase {
    
    private var presenter: MarvelCharactersListsPresenterSpy!
    private var interactor: MarvelCharactersListsInteractor!
    private var apiClient: ApiClientSpy!
    
    override func setUp() {
        interactor = MarvelCharactersListsInteractor(factory: self, viewController: nil, dataSource: MarvelCharactersListsModel.DataSource())
    }
    
    override func tearDown() {
        presenter = nil
        interactor = nil
        apiClient =  nil

    }
}


// MARK: - Tests
extension MarvelCharactersListsInteractorTests {
    
    func testItemPressed() {
        presenter.detailExpectation = expectation(description: "detailExpectation")
        presenter.listExpectation = expectation(description: "listExpectation")
        let testIndex = 0
        let testId = 1011334
        interactor.doRequest(.extractCharactersList(page: 0))
        wait(for: [presenter.listExpectation], timeout: 0.1)
        interactor.doRequest(.characterSelected(selected: testIndex))
        wait(for: [presenter.detailExpectation], timeout: 0.1)
        XCTAssertEqual(testId, presenter.passedId)
    }

    func testShowList() {
        presenter.listExpectation = expectation(description: "listExpectation")
        let testPage = 0
        interactor.doRequest(.extractCharactersList(page: testPage))
        wait(for: [presenter.listExpectation], timeout: 0.1)
        XCTAssertEqual(testPage, apiClient.passedPage)
    
    }
}


// MARK: - MarvelCharactersListsFactorable
extension MarvelCharactersListsInteractorTests: MarvelCharactersListsFactorable {
    
    func makePresenter(viewController: MarvelCharactersListsDisplayLogic?) -> MarvelCharactersListsPresentationLogic {
        presenter = MarvelCharactersListsPresenterSpy()
        return presenter
    }
    
    func makeApiClient() -> APIClientProtocol {
      apiClient = ApiClientSpy()
      return apiClient
    }
    
}

// MARK: - Spy Classes Setup
private extension MarvelCharactersListsInteractorTests {
    
    final class MarvelCharactersListsPresenterSpy: MarvelCharactersListsPresentationLogic {
        var listExpectation: XCTestExpectation!
        var detailExpectation: XCTestExpectation!
        var passedCharacterList: [ResultList]!
        var passedId: Int!
        
        func presentResponse(_ response: MarvelCharactersListsModel.Response) {
            switch response {
            case let .presentCharactersListResponse(data):
                passedCharacterList = data
                listExpectation.fulfill()
                
            case let .presentCharacterDetails(id):
                passedId = id
                detailExpectation.fulfill()
                
            }
        }
    }
    
    final class ApiClientSpy: APIClientProtocol {
        var passedPage: Int!
        var passedId: Int!
        
        func executeCharacters(page: Int, completion: @escaping (_ results: CharactersList?, _ errorString: String)  -> Void) {
            passedPage = page
            if let path = Bundle.main.path(forResource: "charactersList", ofType: "json") {
                if let data = FileManager.default.contents(atPath: path) {
                    let decoder = JSONDecoder()
                    do {
                        let model = try decoder.decode(CharactersList.self, from: data)
                        completion(model, "No errors detected")
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            
        }
        
        func getCharacterDetail(id: Int, completion: @escaping (_ results: ResultList?, _ errorString: String) -> Void) {
            
        }
    }
}

