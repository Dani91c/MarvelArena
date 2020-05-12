//
//  RankingProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: Wireframe
protocol RankingRouterProtocol: class {
    func navigateToPreviousViewController()
    func showshowCharacterDetailViewController(of character: Character)
}

// MARK: Presenter
protocol RankingPresenterProtocol: class {
    func viewDidLoad()
    func backButtonClicked()
    func characterClicked(at index: Int)
}

// MARK: View
protocol RankingViewProtocol: class {
    func setRanking(_ characters: [Character])
    func setInformationLabel()
}
