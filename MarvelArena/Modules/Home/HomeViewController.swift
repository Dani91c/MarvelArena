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
    
    @IBOutlet weak var veilView: UIView!
    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var splashImageTrailingConstraint: NSLayoutConstraint!
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }
    
    private func configureView() {
        setTextInLanguage()
        
        firstTitleLabel.alpha = 0
        secondTitleLabel.alpha = 0
        buttonsView.alpha = 0
        veilView.alpha = 0
        splashImageTrailingConstraint.constant = UIScreen.main.bounds.width
    }
    
    private func setTextInLanguage() {
        firstTitleLabel.text = NSLocalizedString("home.fistTitleLabel", comment: "").uppercased()
        secondTitleLabel.text = NSLocalizedString("home.secondTitleLabel", comment: "").uppercased()
        searchCharacterButton.setTitle(NSLocalizedString("home.searchCharacterButton", comment: ""), for: .normal)
        arenaButton.setTitle(NSLocalizedString("home.arenaButton", comment: ""), for: .normal)
        rankingButton.setTitle(NSLocalizedString("home.rankingButton", comment: ""), for: .normal)
    }
    
    private func startAnimation() {
        
        UIView.animate(withDuration: 1.4, animations: {
            self.splashImageTrailingConstraint.constant = 0
            self.view.layoutIfNeeded()
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                self.firstTitleLabel.alpha = 1
                self.secondTitleLabel.alpha = 1
                self.buttonsView.alpha = 1
                self.veilView.alpha = 0.7
            })
        })
    }
}

// MARK: HomeViewController Protocol
extension HomeViewController: HomeViewProtocol {
}
