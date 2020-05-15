//
//  MarvelAPIProtocols.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: DataSource
protocol MarvelAPIDataSourceProtocol: class {
    func requestCharacters(with name: String?, handle: @escaping Handler)
    func downloadImageData(from url: String, handle: @escaping Handler)
}

// MARK: InteractorInput
protocol MarvelAPIInteractorInputProtocol: class {
    func requestCharacters(with name: String?)
}

// MARK: InteractorOutput
protocol MarvelAPIInteractorOutputProtocol: class {
    func foundCharacters(_ characters: [Character])
    func requestCharactersError(_ error: Error)
}
