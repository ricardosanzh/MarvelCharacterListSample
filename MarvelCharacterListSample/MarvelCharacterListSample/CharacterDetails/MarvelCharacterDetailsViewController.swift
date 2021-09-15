//

import UIKit

protocol MarvelCharacterDetailsDisplayLogic where Self: UIViewController {
  
  func displayViewModel(_ viewModel: MarvelCharacterDetailsModel.ViewModel)
}

final class MarvelCharacterDetailsViewController: BaseViewController {
  
  typealias MarvelCharacterDetailsFactory = MarvelCharacterDetailsInteractorFactorable & MarvelCharacterDetailsRouterFactorable

  private let mainView: MarvelCharacterDetailsView
  private var interactor: MarvelCharacterDetailsInteractable!
  private var router: MarvelCharacterDetailsRouting!
  
  required init(factory: MarvelCharacterDetailsFactory, mainView: MarvelCharacterDetailsView, dataSource: MarvelCharacterDetailsModel.DataSource) {
    self.mainView = mainView
    
    super.init(nibName: nil, bundle: nil)
    
    let interactorFactory = factory as! MarvelCharacterDetailsInteractorFactorable.InteractableFactory
    interactor = factory.makeInteractor(factory: interactorFactory, viewController: self, dataSource: dataSource)
    router = factory.makeRouter(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactor.doRequest(.extractCharacterDetails)
  }
  
  override func loadView() {
    mainView.delegate = self
    view = mainView
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented, You shouldn't initialize the ViewController using Storyboards")
  }
}

// MARK: - MarvelCharacterDetailsDisplayLogic
extension MarvelCharacterDetailsViewController: MarvelCharacterDetailsDisplayLogic {

  func displayViewModel(_ viewModel: MarvelCharacterDetailsModel.ViewModel) {
    DispatchQueue.main.async {
      switch viewModel {
      case .showDetailsInVC(let viewModel):
        self.mainView.updateDataSource(with: viewModel)
        
      }
    }
  }
}


// MARK: - MarvelCharacterDetailsViewDelegate
extension MarvelCharacterDetailsViewController: MarvelCharacterDetailsViewDelegate {
  
  func sendDataBackToParent(_ data: Data) {

  }
}


// MARK: - Private Zone
private extension MarvelCharacterDetailsViewController {
  
}
