//
//  MainRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Foundation
import UIKit

protocol MainRouterProtocol {
    func presentHomeViewController()
}

// MARK: MainRouter
class MainRouter {
    
    let window: UIWindow
    
    init(mainWindow: UIWindow) {
        self.window = mainWindow
    }
    
    var rootViewController: UIViewController {
        guard let rootViewController = window.rootViewController else {
            fatalError("There is no rootViewController installed on the window")
        }
        return rootViewController
    }
}

// MARK: MainRouterProtocol
extension MainRouter: MainRouterProtocol {
    
    func presentHomeViewController() {
        let homeViewController = HomeRouter.createModule(mainRouter: self)
        let rootViewController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = rootViewController
    }
}
