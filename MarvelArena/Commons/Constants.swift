//
//  Constants.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Url {
        
        struct MarvelAPI {
            static let baseUrl = "https://gateway.marvel.com:443/v1/public"
            static let ts = "ts=1"
            static let apiKey = "&apikey=fbb0794f09e0bcac3ee2df924d3749c0"
            static let hash = "&hash=f0f12d4a33fb4079eb165b1a7f88c312"
            struct Endpoints {
                static let characters = "/characters?"
                static let character = "/characters?name="
            }
        }
    }
}
