//
//  SearchCharacterPresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: SearchCharacterPresenter
class SearchCharacterPresenter {

    weak private var view: SearchCharacterViewProtocol?
    var interactor: MarvelAPIInteractorInputProtocol?
    private let router: SearchCharacterRouterProtocol

    init(interface: SearchCharacterViewProtocol, interactor: MarvelAPIInteractorInputProtocol?, router: SearchCharacterRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

// MARK: SearchCharacterPresenter protocol
extension SearchCharacterPresenter: SearchCharacterPresenterProtocol {
    
    func searchCharactersButtonClicked(with name: String) {
        interactor?.requestCharacters(with: name)
    }
    
    func randomButtonClicked() {
        interactor?.requestCharacters(with: nil)
    }
    
    func backButtonClicked() {
        router.navigateToPreviousViewController()
    }
}

// MARK: MarvelAPI InteractorOutput Protocol
extension SearchCharacterPresenter: MarvelAPIInteractorOutputProtocol {
    
    func foundCharacters(_ characters: [Character]) {
        view?.setCharacters(characters)
    }
    
    func requestCharactersError(_ error: String) {
        view?.setError(error)
    }
}
