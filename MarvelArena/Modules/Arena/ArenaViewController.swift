//
//  ArenaViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 11/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: ArenaViewController
class ArenaViewController: BaseViewController {
    
    var presenter: ArenaPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK: ArenaViewController protocol
extension ArenaViewController: ArenaViewProtocol {
}

