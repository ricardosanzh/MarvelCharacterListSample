//

import UIKit

protocol MarvelCharactersListsDisplayLogic where Self: UIViewController {
    func displayViewModel(_ viewModel: MarvelCharactersListsModel.ViewModel)
    
}

final class MarvelCharactersListsViewController: BaseViewController {
    
    typealias MarvelCharactersListsFactory = MarvelCharactersListsInteractorFactorable & MarvelCharactersListsRouterFactorable
    
    private let mainView: MarvelCharactersListsView
    private var interactor: MarvelCharactersListsInteractable!
    private var router: MarvelCharactersListsRouting!
    
    required init(factory: MarvelCharactersListsFactory, mainView: MarvelCharactersListsView, dataSource: MarvelCharactersListsModel.DataSource) {
        self.mainView = mainView
        
        super.init(nibName: nil, bundle: nil)
        
        let interactorFactory = factory as! MarvelCharactersListsInteractorFactorable.InteractableFactory
        interactor = factory.makeInteractor(factory: interactorFactory, viewController: self, dataSource: dataSource)
        router = factory.makeRouter(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.doRequest(.extractCharactersList(page:0))
        
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

// MARK: - MarvelCharactersListsDisplayLogic
extension MarvelCharactersListsViewController: MarvelCharactersListsDisplayLogic {
    
    func displayViewModel(_ viewModel: MarvelCharactersListsModel.ViewModel) {
        DispatchQueue.main.async {
            switch viewModel {
            case .showCharactersListInVC(let viewModelData):
                self.navigationItem.title = viewModelData.title
                self.mainView.updateDataSource(with: viewModelData)
            case .showCharacterDetailsInVC(let id):
                self.router.routeTo(.sendIdToDetailsScreen(id: id))
            }
        }
    }
}


// MARK: - MarvelCharactersListsViewDelegate
extension MarvelCharactersListsViewController: MarvelCharactersListsViewDelegate {
    func characterSelected(selected: Int) {
        interactor.doRequest(.characterSelected(selected: selected))
    }
    
    func nextPage(page: Int) {
        interactor.doRequest(.extractCharactersList(page: page))
    }

}


// MARK: - Private Zone
private extension MarvelCharactersListsViewController {
   
}
