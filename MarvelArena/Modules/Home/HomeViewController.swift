//
//  HomeViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: HomeViewController
class HomeViewController: UIViewController {
    
    var presenter: HomePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: HomeViewController Protocol
extension HomeViewController: HomeViewProtocol {
}

