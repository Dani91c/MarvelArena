//
//  MarvelAPIDataSource.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Alamofire

typealias Handler = (Bool, Data?, String?) -> Void

// MARK: MarvelAPIDataSource
class MarvelAPIDataSource {
    
    private func makePetition(with url: String, handle: @escaping Handler) {
                
        AF.request(url)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    handle(true, data, nil)
                case .failure:
                    if response.response != nil {
                        handle(false, nil, NSLocalizedString("general.serviceError", comment: ""))
                    } else {
                        handle(false, nil, NSLocalizedString("general.conectivityError", comment: ""))
                    }
                }
        }
    }
}

extension MarvelAPIDataSource: MarvelAPIDataSourceProtocol {
    func requestCharacters(with name: String?, handle: @escaping Handler) {
        
        let endpoint = name != nil ? "\(Constants.Url.MarvelAPI.Endpoints.character)\(name!)&" : Constants.Url.MarvelAPI.Endpoints.characters
        let url = Constants.Url.MarvelAPI.baseUrl + endpoint + Constants.Url.MarvelAPI.ts + Constants.Url.MarvelAPI.apiKey + Constants.Url.MarvelAPI.hash
        makePetition(with: url, handle: handle)
    }

    func downloadImageData(from url: String, handle: @escaping Handler) {
        if let imageUrl = URL(string: url.replacingOccurrences(of: "http", with: "https")), let data = try? Data(contentsOf: imageUrl) {
            handle(true, data, nil)
        } else {
            handle(false, nil, NSLocalizedString("general.serviceError", comment: ""))
        }
    }
}
