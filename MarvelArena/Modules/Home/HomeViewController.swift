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
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var searchCharacterButton: UIButton!
    @IBOutlet weak var arenaButton: UIButton!
    @IBOutlet weak var rankingButton: UIButton!
    
    var presenter: HomePresenterProtocol?

    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        presenter?.buttonClicked(position: sender.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        configureView()
    }
    
    private func configureView() {
        setTextInLanguage()
    }
    
    private func setTextInLanguage() {
        firstTitleLabel.text = NSLocalizedString("home.fistTitleLabel", comment: "").uppercased()
        secondTitleLabel.text = NSLocalizedString("home.secondTitleLabel", comment: "").uppercased()
        searchCharacterButton.setTitle(NSLocalizedString("home.searchCharacterButton", comment: ""), for: .normal)
        arenaButton.setTitle(NSLocalizedString("home.arenaButton", comment: ""), for: .normal)
        rankingButton.setTitle(NSLocalizedString("home.rankingButton", comment: ""), for: .normal)
    }
}

// MARK: HomeViewController Protocol
extension HomeViewController: HomeViewProtocol {
}
