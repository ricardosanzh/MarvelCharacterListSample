//
//  BaseView.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 06/09/2021.
//

import UIKit

/// Base View class for common configs.
///
class BaseView: UIView {
  @IBOutlet weak var view: UIView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    view = nibSetup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    view = nibSetup()
  }
}
