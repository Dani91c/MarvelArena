//
//  ArenaPresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 11/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: ArenaPresenter
class ArenaPresenter {

    weak private var view: ArenaViewProtocol?
    var interactor: MarvelAPIInteractorInputProtocol?
    private let router: ArenaRouterProtocol

    init(interface: ArenaViewProtocol, interactor: MarvelAPIInteractorInputProtocol?, router: ArenaRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

// MARK: ArenaPresenter protocol
extension ArenaPresenter: ArenaPresenterProtocol {
}

// MARK: MarvelAPI InteractorOutput Protocol
extension ArenaPresenter: MarvelAPIInteractorOutputProtocol {
    
    func foundCharacters(_ characters: [Character]) {
    }
    
    func requestCharactersError(_ error: String) {
    }
}
