//
//  Character.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

struct Character: Codable {
    let name: String
    let image: Data?
    let description: String?
    let power: Int
}
