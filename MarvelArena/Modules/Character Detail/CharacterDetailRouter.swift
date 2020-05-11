//
//  CharacterDetailRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: CharacterDetailRouter
class CharacterDetailRouter {
    
    let mainRouter: MainRouterProtocol
    
    init(mainRouter: MainRouterProtocol) {
        self.mainRouter = mainRouter
    }
    
    static func createModule(of character: Character, mainRouter: MainRouterProtocol) -> UIViewController {
        
        let view = CharacterDetailViewController()
        let router = CharacterDetailRouter(mainRouter: mainRouter)
        let presenter = CharacterDetailPresenter(interface: view, router: router, character: character)
        
        view.presenter = presenter
        
        return view
    }
}

// MARK: CharacterDetailRouter protocol
extension CharacterDetailRouter: CharacterDetailRouterProtocol {
    func navigateToPreviousViewController() {
        mainRouter.showPreviousViewController(animated: true)
    }
}
