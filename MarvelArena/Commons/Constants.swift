//
//  Constants.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Foundation

// MARK: Constants
struct Constants {
    struct Urls {
        struct MarvelAPI {
            
            static let baseUrl = "https://gateway.marvel.com:443/v1/public"
            static let limit = "15"
            static let ts = "1"
            static let apiKey = "fbb0794f09e0bcac3ee2df924d3749c0"
            static let hash = "f0f12d4a33fb4079eb165b1a7f88c312"
            
            struct Endpoints {
                static let characters = "/characters?"
            }
        }
    }
    
    static let imageNotAvailable = "image_not_available"
}
