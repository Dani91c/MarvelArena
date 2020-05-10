//
//  CharacterDetailViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

// MARK: CharacterDetailViewController
class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    
    var presenter: CharacterDetailPresenterProtocol?
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        presenter?.backButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: CharacterDetailViewController protocol
extension CharacterDetailViewController: CharacterDetailViewProtocol {
    
    func setCharacterDetail(of character: Character) {
        characterNameLabel.text = character.name.uppercased()
        characterImageView.image = character.image
        characterDescriptionLabel.text = character.description != "" ? character.description : NSLocalizedString("characterDetail.descriptionNotAvailable", comment: "")
    }
}
