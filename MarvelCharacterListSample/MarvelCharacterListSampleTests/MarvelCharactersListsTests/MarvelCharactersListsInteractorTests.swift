//

import XCTest
@testable import MarvelCharacterListSample


final class MarvelCharactersListsInteractorTests: XCTestCase {
  
  private var presenter: MarvelCharactersListsPresenterSpy!
  private var interactor: MarvelCharactersListsInteractor!
  
  override func setUp() {
    interactor = MarvelCharactersListsInteractor(factory: self, viewController: nil, dataSource: MarvelCharactersListsModel.DataSource())
  }
  
  override func tearDown() {
    presenter = nil
    interactor = nil
  }
}


// MARK: - Tests
extension MarvelCharactersListsInteractorTests {
  

}


// MARK: - MarvelCharactersListsFactorable
extension MarvelCharactersListsInteractorTests: MarvelCharactersListsFactorable {
  
  func makePresenter(viewController: MarvelCharactersListsDisplayLogic?) -> MarvelCharactersListsPresentationLogic {
    presenter = MarvelCharactersListsPresenterSpy()
    return presenter
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
  
  final class ApiServiceSpy: APIClient {
    var passedPage: Int!
    var passedId: Int!
    
//    func executeCharacters(page: Int, completion: @escaping (_ results: CharactersList?, _ errorString:String)  -> Void) {
//      passedPage = page
//      if page == 1 {
//        let error = NetworkError.parameterEncodingFailed(reason: .missingURL)
//        completion(.failure(error), 500)
//      }
//      if let data = FileManager.default.contents(atPath: R.file.charactersListJson()!.path) {
//        let decoder = JSONDecoder()
//        do {
//          let model = try decoder.decode(CharactersList.self, from: data)
//          completion(.success(model), 200)
//        } catch {
//          fatalError(error.localizedDescription)
//        }
//      }
//     }
    
//    func getCharacterDetail(id: Int, completion: @escaping (_ results: ResultList?, _ errorString:String) -> Void) {
//
//    }
  }
}

