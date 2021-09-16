//

import UIKit

protocol MarvelCharacterDetailsViewDelegate where Self: UIViewController {
    
    func sendDataBackToParent(_ data: Data)
}

final class MarvelCharacterDetailsView: BaseView {
    
    weak var delegate: MarvelCharacterDetailsViewDelegate?
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var lastAppearanceLabel: UILabel!
    
    private var dataSource: MarvelCharacterDetailsModel.ViewDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUIComponents()
    }
    
    func updateDataSource(with dataSource: MarvelCharacterDetailsModel.ViewDataSource) {
      self.dataSource = dataSource
        titleLabel.text = dataSource.characterName
        descriptionLabel.text = dataSource.characterDescription
        lastAppearanceLabel.text = dataSource.characterLastAppearance
        
        if let path = dataSource.imageName {
          let urlImage = URL(string: path)
            characterImage.kf.setImage(with: urlImage)
        }
    }
}

private extension MarvelCharacterDetailsView {
    private func setupUIComponents() {
        containerView.layer.cornerRadius = 20
        
    }
}

