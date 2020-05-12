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
    func showPreviousViewController(animated: Bool)
    func presentHomeViewController()
    func showSearchCharacterViewController()
    func showArenaViewController()
    func showRankingViewController()
    func showCharacterDetailViewController(of character: Character)
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
    
    private func navigationController() -> UINavigationController? {
        if rootViewController.navigationController == nil {
            return (rootViewController as? UINavigationController)
        } else {
            return rootViewController.navigationController
        }
    }
    
    private func push(viewController: UIViewController, animated: Bool) {
        navigationController()?.pushViewController(viewController, animated: animated)
    }
}

// MARK: MainRouterProtocol
extension MainRouter: MainRouterProtocol {

    func showPreviousViewController(animated: Bool) {
        navigationController()?.popViewController(animated: animated)
    }
    
    func presentHomeViewController() {
        let homeViewController = HomeRouter.createModule(mainRouter: self)
        let rootViewController = UINavigationController(rootViewController: homeViewController)
        window.rootViewController = rootViewController
    }
    
    func showSearchCharacterViewController() {
        let searchCharacterViewController = SearchCharacterRouter.createModule(mainRouter: self)
        push(viewController: searchCharacterViewController, animated: true)
    }
    
    func showArenaViewController() {
        let arenaViewController = ArenaRouter.createModule(mainRouter: self)
        push(viewController: arenaViewController, animated: true)
    }
    
    func showRankingViewController() {
        let rankingViewController = RankingRouter.createModule(mainRouter: self)
        push(viewController: rankingViewController, animated: true)
    }

    func showCharacterDetailViewController(of character: Character) {
        let characterDetailViewController = CharacterDetailRouter.createModule(of: character, mainRouter: self)
        push(viewController: characterDetailViewController, animated: true)
    }
}
