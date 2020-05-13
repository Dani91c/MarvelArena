//
//  ArenaProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 11/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: Wireframe
protocol ArenaRouterProtocol: class {
    func navigateToPreviousViewController()
    func showRankingViewController()
}

// MARK: Presenter
protocol ArenaPresenterProtocol: class {
    func searchCharactersButtonClicked(with name: String)
    func randomButtonClicked()
    func backButtonClicked()
    func characterClicked(at index: Int)
    func fightButtonClicked()
    func resetButtonClicked()
    func rankingButtonClicked()
}

// MARK: View
protocol ArenaViewProtocol: class {
    func setCharacters(_ characters: [Character])
    func setPlayer(number: Int, with character: Character)
    func enableFightButton(_ isEnable: Bool)
    func showLoading(_ isShown: Bool)
    func showError(_ error: String)
    func showResult(winner: Character)
    func resetScreen()
}
