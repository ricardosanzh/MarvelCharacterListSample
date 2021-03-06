//
//  BaseViewController.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 06/09/2021.
//

import UIKit

/// Base ViewController class for common configs.
///
class BaseViewController: UIViewController {
    var isNavigationBarAnimated: Bool { true }
    var isNavigationBarHidden: Bool { false }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { statusBarStyle }
    
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {

            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationController?.navigationBar.tintColor = UIColor.white
        if let font = Fonts.Bold.arialBold21 {
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white, .font: font]
        }
        
        navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: isNavigationBarAnimated)
    }
}
