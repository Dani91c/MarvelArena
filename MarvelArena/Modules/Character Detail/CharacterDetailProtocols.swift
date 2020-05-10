//
//  CharacterDetailProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: Wireframe
protocol CharacterDetailRouterProtocol: class {
    func navigateToPreviousViewController()
}

// MARK: Presenter
protocol CharacterDetailPresenterProtocol: class {
    func viewDidLoad()
    func backButtonClicked()
}

// MARK: View
protocol CharacterDetailViewProtocol: class {
    func setCharacterDetail(of character: Character)
}
