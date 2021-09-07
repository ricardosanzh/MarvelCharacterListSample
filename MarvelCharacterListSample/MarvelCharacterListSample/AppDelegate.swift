//
//  AppDelegate.swift
//  MarvelCharacterListSample
//
//  Created by r.a.sanz.hinojosas on 03/09/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      setUpWindowVC()
      return true
    }

    func setUpWindowVC() {
      let vc = MarvelCharactersListsViewController(factory: AppInjector.MarvelCharactersListsInjector(), mainView: MarvelCharactersListsView.init(), dataSource: MarvelCharactersListsModel.DataSource())
      let navigationController = UINavigationController(rootViewController: vc)
      window = UIWindow.init(frame: UIScreen.main.bounds)
      window?.makeKeyAndVisible()
      window?.rootViewController = navigationController
    }
}


