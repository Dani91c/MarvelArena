//
//  Character.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

class Character {
    let name: String
    let image: UIImage
    let description: String?
    let power: Int?
    
    init(name: String, image: UIImage, description: String, power: Int) {
        self.name = name
        self.image = image
        self.description = description
        self.power = power
    }
}
