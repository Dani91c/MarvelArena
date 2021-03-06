//
//  SearchCharacterProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: Wireframe
protocol SearchCharacterRouterProtocol: class {
    func navigateToPreviousViewController()
    func showshowCharacterDetailViewController(of character: Character)
}

// MARK: Presenter
protocol SearchCharacterPresenterProtocol: class {
    func searchCharactersButtonClicked(with name: String)
    func randomButtonClicked()
    func backButtonClicked()
    func characterClicked(at index: Int)
}

// MARK: View
protocol SearchCharacterViewProtocol: class {
    func setCharacters(_ characters: [Character])
    func showLoading(_ isShown: Bool)
    func showError(_ error: Error)
}
