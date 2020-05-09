//
//  HomePresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: HomePresenter
class HomePresenter {

    weak private var view: HomeViewProtocol?
    private let router: HomeRouterProtocol

    init(interface: HomeViewProtocol, router: HomeRouterProtocol) {
        self.view = interface
        self.router = router
    }
}

// MARK: HomePresenter Protocol
extension HomePresenter: HomePresenterProtocol {
    
    func buttonClicked(position: Int) {
        switch position {
        case 0:
            router.showSearchCharacterViewController()
        case 1:
            router.showArenaViewController()
        default:
            router.showRankingViewController()
        }
        
    }
}
