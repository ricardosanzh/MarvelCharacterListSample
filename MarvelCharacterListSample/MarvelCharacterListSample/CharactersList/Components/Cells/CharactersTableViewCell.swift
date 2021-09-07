//
//  CharactersCell.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 06/09/2021.
//

import UIKit
import Kingfisher

final class CharactersTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageCharacter: UIImageView!
    
    func prepareCell(with model: MarvelCharactersListsModel.CharactersCellModel) {
        titleLabel.text = model.charecterName
        if let path = model.characterImage {
            let urlImage = URL(string: path)
            imageCharacter.kf.setImage(with: urlImage)
        }
    }
}
