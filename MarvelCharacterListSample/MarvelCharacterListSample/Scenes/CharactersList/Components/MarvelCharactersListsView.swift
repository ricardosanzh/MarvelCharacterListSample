//

import UIKit

protocol MarvelCharactersListsViewDelegate where Self: UIViewController {
    func nextPage(page:Int)
    func characterSelected(selected: Int)
}

final class MarvelCharactersListsView: BaseView {
    weak var delegate: MarvelCharactersListsViewDelegate?
    private var dataSource: MarvelCharactersListsModel.ViewDataSource?
    @IBOutlet weak var charactersTableView: UITableView!
    
    var page = 0
    let minReloadableItems: Int = 2
    var reloadList: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUIComponents()
    }
    
    func updateDataSource(with dataSource: MarvelCharactersListsModel.ViewDataSource) {
        self.dataSource = dataSource
        self.charactersTableView.reloadData()
        self.reloadList = false
        
    }
    
    func reloadUIComponents() {
        self.charactersTableView.tableFooterView = UIView()
        self.charactersTableView.reloadData()
    }
    func retryRequest() {
        delegate?.nextPage(page: page)
    }
    
}

private extension MarvelCharactersListsView {
    private func setupUIComponents() {
        charactersTableView.layer.cornerRadius = 20
        charactersTableView.allowsMultipleSelection = false
        self.charactersTableView.register(UINib.init(nibName: Constants.Cells.charactersTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cells.charactersTableViewCell)
    }
}

extension MarvelCharactersListsView:  UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = dataSource {
            return data.items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.charactersTableViewCell, for: indexPath) as? CharactersTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = dataSource  {
            cell.prepareCell(with: data.items[indexPath.row])
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).")
        delegate?.characterSelected(selected: indexPath.row)

    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView == charactersTableView {
            if let data = dataSource  {
                if !data.items.isEmpty {
                    if !self.reloadList &&  data.items.count - (indexPath as NSIndexPath).row < minReloadableItems {
                        self.reloadList = true
                        page += 1
                        delegate?.nextPage(page: page)
                    }
                }
            }
        }
    }
    
}
