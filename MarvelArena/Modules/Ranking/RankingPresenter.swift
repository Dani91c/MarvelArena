//
//  RankingPresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: RankingPresenter
class RankingPresenter {

    weak private var view: RankingViewProtocol?
    private let router: RankingRouterProtocol
    
    var characters: [Character]?

    init(interface: RankingViewProtocol, router: RankingRouterProtocol) {
        self.view = interface
        self.router = router
    }
}

// MARK: RankingPresenter protocol
extension RankingPresenter: RankingPresenterProtocol {
}
