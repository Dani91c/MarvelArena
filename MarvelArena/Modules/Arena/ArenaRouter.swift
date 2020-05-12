//
//  ArenaRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 11/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: ArenaRouter
class ArenaRouter {
    
    let mainRouter: MainRouterProtocol
    
    init(mainRouter: MainRouterProtocol) {
        self.mainRouter = mainRouter
    }
    
    static func createModule(mainRouter: MainRouterProtocol) -> UIViewController {
        
        let view = ArenaViewController()
        let dataSource = MarvelAPIDataSource()
        let interactor = MarvelAPIInteractor(dataSource: dataSource)
        let router = ArenaRouter(mainRouter: mainRouter)
        let presenter = ArenaPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

// MARK: ArenaRouter protocol
extension ArenaRouter: ArenaRouterProtocol {
    
    func navigateToPreviousViewController() {
        mainRouter.showPreviousViewController(animated: true)
    }
    
    func showRankingViewController() {
        mainRouter.showRankingViewController()
    }
}
