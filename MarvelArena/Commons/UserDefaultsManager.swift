//
//  UserDefaultsManager.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Foundation

// MARK: UserDefaultsManager
class UserDefaultsManager {
    
    static func getCharacterRanking() -> [Character] {
    
        guard let data = UserDefaults.standard.data(forKey: "RankingCharacters"),
            let array = try? PropertyListDecoder().decode([Character].self, from: data) else {
                return []
        }
        return array
    }
    
    static func setCharacterRanking(_ characters: [Character]) {
        
        if let data = try? PropertyListEncoder().encode(characters) {
            UserDefaults.standard.set(data, forKey: "RankingCharacters")
        }
    }
    
    static func addToCharacterRanking(_ characters: [Character]) {
        
        var rankingCharacters = getCharacterRanking()
        var isAlreadyStored: Bool = false
        for character in characters {
            isAlreadyStored = false
            for storedCharacter in rankingCharacters where storedCharacter.name == character.name {
                isAlreadyStored = true
                break
            }
            !isAlreadyStored ? rankingCharacters.append(character) : nil
        }

        if let data = try? PropertyListEncoder().encode(rankingCharacters) {
            UserDefaults.standard.set(data, forKey: "RankingCharacters")
        }
    }
}
