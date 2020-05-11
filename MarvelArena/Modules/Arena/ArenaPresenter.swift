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
    
    var characters: [Character]?
    var playerOneCharacter: Character?
    var playerTwoCharacter: Character?

    init(interface: ArenaViewProtocol, interactor: MarvelAPIInteractorInputProtocol?, router: ArenaRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

// MARK: ArenaPresenter protocol
extension ArenaPresenter: ArenaPresenterProtocol {

    func searchCharactersButtonClicked(with name: String) {
        view?.showLoading(true)
        interactor?.requestCharacters(with: name)
    }
    
    func randomButtonClicked() {
        view?.showLoading(true)
        interactor?.requestCharacters(with: nil)
    }
    
    func backButtonClicked() {
        router.navigateToPreviousViewController()
    }
    
    func characterClicked(at index: Int) {
        if playerOneCharacter == nil {
            playerOneCharacter = characters![index]
            view?.setPlayer(number: 1, with: playerOneCharacter!)
        } else if playerTwoCharacter == nil {
            playerTwoCharacter = characters![index]
            view?.setPlayer(number: 2, with: playerTwoCharacter!)
            view?.enableFightButton(true)
        }
    }
    
    func fightButtonClicked() {
        
        let winner = playerOneCharacter!.power > playerTwoCharacter!.power ? playerOneCharacter!.name : playerTwoCharacter!.name
        view?.showResult(winner: winner)
    }
    
    func resetButtonClicked() {
        characters = []
        playerOneCharacter = nil
        playerTwoCharacter = nil
        view?.resetScreen()
    }
    
    func rankingButtonClicked() {
        router.showRankingViewController()
    }
}

// MARK: MarvelAPI InteractorOutput Protocol
extension ArenaPresenter: MarvelAPIInteractorOutputProtocol {
    
 func foundCharacters(_ characters: [Character]) {
        self.characters = characters
        view?.showLoading(false)
        view?.setCharacters(characters)
    }
    
    func requestCharactersError(_ error: String) {
        view?.showLoading(false)
        view?.showError(error)
    }
}
