//
//  CharacterDetailPresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: CharacterDetailPresenter
class CharacterDetailPresenter {

    weak private var view: CharacterDetailViewProtocol?
    private let router: CharacterDetailRouterProtocol
    
    var character: Character

    init(interface: CharacterDetailViewProtocol, router: CharacterDetailRouterProtocol, character: Character) {
        self.view = interface
        self.router = router
        self.character = character
    }
}

// MARK: CharacterDetailPresenter protocol
extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {
    
    func viewDidLoad() {
        view?.setCharacterDetail(of: self.character)
    }
    
    func backButtonClicked() {
        router.navigateToPreviousViewController()
    }
}
