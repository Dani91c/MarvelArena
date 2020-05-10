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
    
    let chatacterCellID = "CharacterTableViewCell"
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var informationLabel: UILabel!
    
    var presenter: SearchCharacterPresenterProtocol?
    
    var characters: [Character] = []
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        presenter?.backButtonClicked()
    }
    
    @IBAction func randomButtonTouchUpInside(_ sender: UIButton) {
        presenter?.randomButtonClicked()
        searchBar.resignFirstResponder()
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
    }
    
    private func setTextInLanguage() {
        
        informationLabel.text = NSLocalizedString("searchCharacter.informationLabel", comment: "")
    }
}

// MARK: SearchBar Delegate
extension SearchCharacterViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.searchCharactersButtonClicked(with: searchBar.text!)
        searchBar.resignFirstResponder()
    }
}

// MARK: TableView Delegate and DataSource
extension SearchCharacterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: chatacterCellID, for: indexPath) as? CharacterTableViewCell
        cell?.characterImage.image = characters[indexPath.row].image
        cell?.characterNameLabel.text = characters[indexPath.row].name.uppercased()
        cell?.selectionStyle = .none
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.characterClicked(at: indexPath.row)
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}

// MARK: SearchCharacterViewController protocol
extension SearchCharacterViewController: SearchCharacterViewProtocol {
    
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
    
    func setError(_ error: String) {
    }
}
