//
//  HomeProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: Wireframe
protocol HomeRouterProtocol: class {
    func showSearchCharacterViewController()
    func showArenaViewController()
    func showRankingViewController()
}

// MARK: Presenter
protocol HomePresenterProtocol: class {
    func buttonClicked(position: Int)
}

// MARK: View
protocol HomeViewProtocol: class {
  var presenter: HomePresenterProtocol? { get set }
}
