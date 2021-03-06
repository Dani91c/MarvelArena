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
    
    let chatacterCellID = "ArenaTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var informationLabel: UILabel!
    
    @IBOutlet weak var playerOneImageView: UIImageView!
    @IBOutlet weak var playerOneNameLabel: UILabel!
    @IBOutlet weak var playerTwoImageView: UIImageView!
    @IBOutlet weak var playerTwoNameLabel: UILabel!
    
    @IBOutlet weak var fightButton: UIButton!
    
    var presenter: ArenaPresenterProtocol?
    
    var resultAlertView: ResultAlertView?
    var characters: [Character] = []
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        presenter?.backButtonClicked()
    }
    
    @IBAction func randomButtonTouchUpInside(_ sender: UIButton) {
        presenter?.randomButtonClicked()
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
    
    @IBAction func fightButtonTouchUpInside(_ sender: Any) {
        presenter?.fightButtonClicked()
    }
    
    override func errorButtonTouchUpInside() {
        characters = []
        tableView.reloadData()
        tableView.isHidden = true
        informationLabel.isHidden = false
        informationLabel.text = NSLocalizedString("arena.informationLabel", comment: "")
        searchBar.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        searchBar.delegate = self
        tableView.register(UINib.init(nibName: chatacterCellID, bundle: nil), forCellReuseIdentifier: chatacterCellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        setTextInLanguage()
        
        searchBar.barTintColor = UIColor(red: 221/255.0, green: 58/255.0, blue: 49/255.0, alpha: 1.0)
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.gray
            textField.textColor = UIColor.white
        }
        
        enableFightButton(false)
    }
    
    private func setTextInLanguage() {
        
        titleLabel.text = NSLocalizedString("arena.titleLabel", comment: "").uppercased()
        informationLabel.text = NSLocalizedString("arena.informationLabel", comment: "")
        playerOneNameLabel.text = NSLocalizedString("arena.playerOneLabel", comment: "")
        playerTwoNameLabel.text = NSLocalizedString("arena.playerTwoLabel", comment: "")
        fightButton.setTitle(NSLocalizedString("arena.fightButtonLabel", comment: ""), for: .normal)
    }
}

// MARK: SearchBar Delegate
extension ArenaViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchCharactersButtonClicked(with: searchBar.text!)
        searchBar.resignFirstResponder()
    }
}

// MARK: TableView Delegate and DataSource
extension ArenaViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatacterCellID, for: indexPath) as? ArenaTableViewCell
        cell?.characterImage.image = characters[indexPath.row].image != nil ? UIImage(data: characters[indexPath.row].image!) : UIImage(named: "default_character_image")
        cell?.characterNameLabel.text = characters[indexPath.row].name.uppercased()
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.characterClicked(at: indexPath.row)
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: ArenaViewController protocol
extension ArenaViewController: ArenaViewProtocol {
   
    func setCharacters(_ characters: [Character]) {
        
        if characters.count > 0 {
            self.characters = characters
            tableView.reloadData()
            tableView.isHidden = false
            informationLabel.isHidden = true
            
        } else {
            tableView.isHidden = true
            informationLabel.text = NSLocalizedString("searchCharacter.noResultsError", comment: "")
            informationLabel.isHidden = false
        }
    }
    
    func setPlayer(number: Int, with character: Character) {
        
        let playerImage = character.image != nil ? UIImage(data: character.image!) : UIImage(named: "default_character_image")
        let playerName = character.name.uppercased().replacingOccurrences(of: "\\s?\\([\\w\\s]*\\)", with: "", options: .regularExpression)
        
        switch number {
        case 1:
            playerOneImageView.image = playerImage
            playerOneNameLabel.text = playerName
        default:
            playerTwoImageView.image = playerImage
            playerTwoNameLabel.text = playerName
        }
    }
    
    func enableFightButton(_ isEnable: Bool) {
        fightButton.isEnabled = isEnable
        fightButton.alpha = isEnable ? 1 : 0.5
    }
    
    func showResult(winner: Character) {
        
        resultAlertView = ResultAlertView(with: winner)
        resultAlertView?.delegate = self
        resultAlertView?.show(in: self.view)
    }
    
    func resetScreen() {
        errorButtonTouchUpInside()
        playerOneNameLabel.text = NSLocalizedString("arena.playerOneLabel", comment: "")
        playerOneImageView.image = UIImage(named: "default_character_image")
        playerTwoNameLabel.text = NSLocalizedString("arena.playerTwoLabel", comment: "")
        playerTwoImageView.image = UIImage(named: "default_character_image")
        enableFightButton(false)
    }
}
  
// MARK: ResultAlertView Delegate
extension ArenaViewController: ResultAlertViewDelegate {
    func fightAgainButtonPressed(view: ResultAlertView) {
        presenter?.resetButtonClicked()
        resultAlertView = nil
    }
    
    func rankingButtonPressed(view: ResultAlertView) {
        self.presenter?.rankingButtonClicked()
        resultAlertView = nil
    }
  }
