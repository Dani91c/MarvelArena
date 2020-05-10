//
//  MarvelAPIInteractor.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

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
    func requestCharacters(with name: String?) {
        dataSource?.requestCharacters(with: name, handle: { (isSuccess, data, error) in
            if isSuccess {
                do {
                    let marvelAPIResponse = try JSONDecoder().decode(MarvelAPIResponse.self, from: data!)
                    var characters: [Character] = []
                    for character in marvelAPIResponse.data.results {
//                        if !character.thumbnail.path.contains("image_not_available") {
                            let imageUrl = "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)"
                            self.dataSource?.downloadImageData(from: imageUrl, handle: { (isSuccess, imageData, error) in
                                if isSuccess, let image = UIImage(data: imageData!) {
                                    let character = Character(name: character.name,
                                                              image: image,
                                                              description: character.resultDescription,
                                                              power: character.comics.available)
                                    characters.append(character)
                                } else {
                                    self.presenter?.requestCharactersError(error!)
                                    return
                                }
                            })
//                        }
                    }
                    self.presenter?.foundCharacters(characters)
                } catch {
                    self.presenter?.requestCharactersError(NSLocalizedString("general.serviceError", comment: ""))
                }
            } else {
                self.presenter?.requestCharactersError(error!)
            }
        })
    }
}
