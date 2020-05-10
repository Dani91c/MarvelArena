//
//  SearchCharacterRouter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: SearchCharacterRouter
class SearchCharacterRouter {
    
    let mainRouter: MainRouterProtocol
    
    init(mainRouter: MainRouterProtocol) {
        self.mainRouter = mainRouter
    }
    
    static func createModule(mainRouter: MainRouterProtocol) -> UIViewController {
        
        let view = SearchCharacterViewController()
        let dataSource = MarvelAPIDataSource()
        let interactor = MarvelAPIInteractor(dataSource: dataSource)
        let router = SearchCharacterRouter(mainRouter: mainRouter)
        let presenter = SearchCharacterPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

// MARK: SearchCharacterRouter protocol
extension SearchCharacterRouter: SearchCharacterRouterProtocol {
    func navigateToPreviousViewController() {
        mainRouter.showPreviousViewController(animated: true)
    }
}
