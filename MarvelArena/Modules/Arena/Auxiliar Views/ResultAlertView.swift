//
//  ResultAlertView.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 13/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

protocol ResultAlertViewDelegate: class {
    func fightAgainButtonPressed(view: ResultAlertView)
    func rankingButtonPressed(view: ResultAlertView)
}

class ResultAlertView: UIView, Modal {
        
    weak var delegate: ResultAlertViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var popupView: UIView!
 
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var fightAgainButton: UIButton!
    @IBOutlet weak var rankingButton: UIButton!
    
    @IBAction func fightAgainButtonTouchUpInside (_ sender: Any) {
        self.dismiss()
        self.delegate?.fightAgainButtonPressed(view: self)
    }
    
    @IBAction func rankingButtonTouchUpInside(_ sender: Any) {
        self.dismiss()
        self.delegate?.rankingButtonPressed(view: self)
    }
    
    convenience init(with winner: Character) {
        self.init(frame: UIScreen.main.bounds)
        configureView(with: winner)
        setTextInLanguage()
    }
    
    private func configureView(with character: Character) {
        Bundle.main.loadNibNamed("ResultAlertView", owner: self, options: nil)
        addSubview(contentView)
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        contentView.clipsToBounds = true
        contentView.frame = self.bounds
        
        characterImage.image = character.image != nil ? UIImage(data: character.image!) : UIImage(named: "default_character_image")
        characterNameLabel.text = character.name
    }
    
    private func setTextInLanguage() {
        titleLabel.text = NSLocalizedString("ResultAlertView.title", comment: "")
        fightAgainButton.setTitle(NSLocalizedString("ResultAlertView.fightAgainButton", comment: ""), for: .normal)
        rankingButton.setTitle(NSLocalizedString("ResultAlertView.rankingButton", comment: ""), for: .normal)
    }
}
