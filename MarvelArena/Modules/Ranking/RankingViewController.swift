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
    
    let chatacterCellID = "RankingTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RankingPresenterProtocol?
    
    var characters: [Character] = []
            
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        presenter?.backButtonClicked()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        tableView.register(UINib.init(nibName: chatacterCellID, bundle: nil), forCellReuseIdentifier: chatacterCellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        setTextInLanguage()
    }
    
    private func setTextInLanguage() {
        titleLabel.text = NSLocalizedString("ranking.titleLabel", comment: "").uppercased()
    }
}

// MARK: TableView Delegate and DataSource
extension RankingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatacterCellID, for: indexPath) as? RankingTableViewCell
        cell?.positionLabel.text = String(indexPath.row + 1)
        cell?.characterImage.image = characters[indexPath.row].image != nil ? UIImage(data: characters[indexPath.row].image!) : UIImage(named: "default_character_image")
        cell?.characterNameLabel.text = characters[indexPath.row].name.uppercased()
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.characterClicked(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: RankingViewController protocol
extension RankingViewController: RankingViewProtocol {
   
    func setInformationLabel() {
        tableView.isHidden = true
        informationLabel.isHidden = false
        informationLabel.text = NSLocalizedString("ranking.informationLabel", comment: "")
    }
    
    func setRanking(_ characters: [Character]) {
        self.characters = characters
        tableView.reloadData()
        tableView.isHidden = false
        informationLabel.isHidden = true
    }
}
