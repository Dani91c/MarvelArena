//
//  RankingViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: RankingViewController
class RankingViewController: BaseViewController {
    
    var presenter: RankingPresenterProtocol?
    
    var characters: [Character] = []
            
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: RankingViewController protocol
extension RankingViewController: RankingViewProtocol {
}
