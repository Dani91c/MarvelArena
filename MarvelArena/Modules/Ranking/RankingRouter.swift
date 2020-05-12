//
//  RankingRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: RankingRouter
class RankingRouter {
    
    let mainRouter: MainRouterProtocol
    
    init(mainRouter: MainRouterProtocol) {
        self.mainRouter = mainRouter
    }
    
    static func createModule(mainRouter: MainRouterProtocol) -> UIViewController {
        
        let view = RankingViewController()
        let router = RankingRouter(mainRouter: mainRouter)
        let presenter = RankingPresenter(interface: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
}

// MARK: RankingRouter protocol
extension RankingRouter: RankingRouterProtocol {
    func navigateToPreviousViewController() {
        mainRouter.showPreviousViewController(animated: true)
    }
    
    func showshowCharacterDetailViewController(of character: Character) {
        mainRouter.showCharacterDetailViewController(of: character)
    }
}
