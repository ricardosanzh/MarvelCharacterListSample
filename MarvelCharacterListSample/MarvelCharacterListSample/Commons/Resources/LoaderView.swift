//
//  LoaderView.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 08/09/2021.
//

import UIKit

/// Loader view created for using it when waiting for the services callback.
///
enum LoaderView {
  
  static func toggleUniversalLoadingView(_ show: Bool, loadingText : String = "", alpha: CGFloat = 1.0) {
    let uniqueTagIdentifier = 1_200
    DispatchQueue.main.async {
      let window = UIApplication.shared.windows[0]
      let existingView = window.viewWithTag(uniqueTagIdentifier)
      if show {
        if existingView != nil {
          return
        }
        let loadingView = self.makeLoadingView(withFrame: UIScreen.main.bounds, loadingText: loadingText, alpha: alpha)
        loadingView?.tag = uniqueTagIdentifier
        window.addSubview(loadingView!)
      } else {
        existingView?.removeFromSuperview()
      }
    }
  }
  
  static func makeLoadingView(withFrame frame: CGRect, loadingText text: String?, alpha: CGFloat) -> UIView? {
    let loadingView = UIView(frame: frame)
    loadingView.backgroundColor = UIColor.white.withAlphaComponent(alpha)
    let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    activityIndicator.layer.cornerRadius = 6
    activityIndicator.center = loadingView.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.style = .medium
    activityIndicator.color = .black
    activityIndicator.startAnimating()
    loadingView.addSubview(activityIndicator)
    if !text!.isEmpty {
      let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
      let cpoint = CGPoint(x: activityIndicator.frame.origin.x + activityIndicator.frame.size.width / 2, y: activityIndicator.frame.origin.y + 80)
      lbl.center = cpoint
      lbl.textColor = UIColor.white
      lbl.textAlignment = .center
      lbl.text = text
      loadingView.addSubview(lbl)
    }
    return loadingView
  }
}
