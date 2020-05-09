//
//  MarvelAPIInteractor.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: MarvelAPIInteractor
class MarvelAPIInteractor {

    weak var presenter: MarvelAPIInteractorOutputProtocol?
    var dataSource: MarvelAPIDataSourceProtocol?

    init(dataSource: MarvelAPIDataSourceProtocol) {
        self.dataSource = dataSource
    }
}

// MARK: MarvelAPIInteractor protocol
extension MarvelAPIInteractor: MarvelAPIInteractorInputProtocol {
}
