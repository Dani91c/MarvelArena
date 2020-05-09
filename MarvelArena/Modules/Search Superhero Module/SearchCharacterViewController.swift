//
//  SearchCharacterViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: SearchCharacterViewController
class SearchCharacterViewController: UIViewController {
    
    var presenter: SearchCharacterPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: SearchCharacterViewController protocol
extension SearchCharacterViewController: SearchCharacterViewProtocol {
}
