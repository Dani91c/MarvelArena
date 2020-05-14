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
    
    private func makePetition(with url: String, and parameters: [String: Any], handle: @escaping Handler) {
            
        AF.request(url, method: .get, parameters: parameters)
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
    
        let url = Constants.Urls.MarvelAPI.baseUrl + Constants.Urls.MarvelAPI.Endpoints.characters
        
        var parameters: [String: Any] = [
            "ts": Constants.Urls.MarvelAPI.ts,
            "apikey": Constants.Urls.MarvelAPI.apiKey,
            "hash": Constants.Urls.MarvelAPI.hash,
            "limit": Constants.Urls.MarvelAPI.limit
        ]
        name != nil ? parameters["nameStartsWith"] = name : nil
    
        makePetition(with: url, and: parameters, handle: handle)
    }

    func downloadImageData(from url: String, handle: @escaping Handler) {
        if let imageUrl = URL(string: url.replacingOccurrences(of: "http", with: "https")), let data = try? Data(contentsOf: imageUrl) {
            handle(true, data, nil)
        } else {
            handle(false, nil, NSLocalizedString("general.serviceError", comment: ""))
        }
    }
}
