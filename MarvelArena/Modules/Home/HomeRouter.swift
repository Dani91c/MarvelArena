//
//  HomeRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: HomeRouter
class HomeRouter {
    
    var mainRouter: MainRouterProtocol
    
    init(mainRouter: MainRouterProtocol) {
        self.mainRouter = mainRouter
    }
    
    static func createModule(mainRouter: MainRouterProtocol) -> UIViewController {
        let view = HomeViewController()
        let router = HomeRouter(mainRouter: mainRouter)
        let presenter = HomePresenter(interface: view, router: router)
        view.presenter = presenter
        return view
    }
}

// MARK: HomeRouter Protocol
extension HomeRouter: HomeRouterProtocol {
    
    func showSearchCharacterViewController() {
        mainRouter.showSearchCharacterViewController()
    }
    
    func showArenaViewController() {
        mainRouter.showArenaViewController()
    }
    
    func showRankingViewController() {
        mainRouter.showRankingViewController()
    }
}
