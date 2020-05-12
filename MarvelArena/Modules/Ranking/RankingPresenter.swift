//
//  RankingPresenter.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 12/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

// MARK: RankingPresenter
class RankingPresenter {

    weak private var view: RankingViewProtocol?
    private let router: RankingRouterProtocol
    
    var sortedCharacters: [Character]?

    init(interface: RankingViewProtocol, router: RankingRouterProtocol) {
        self.view = interface
        self.router = router
    }
}

// MARK: RankingPresenter protocol
extension RankingPresenter: RankingPresenterProtocol {
    
    func viewDidLoad() {
        let characters = UserDefaultsManager.getCharacterRanking()
        if characters.count > 0 {
            sortedCharacters = characters.sorted { $0.power > $1.power }
            view?.setRanking(sortedCharacters!)
        } else {
            view?.setInformationLabel()
        }
    }
    
    func backButtonClicked() {
        router.navigateToPreviousViewController()
    }
    
    func characterClicked(at index: Int) {
        router.showshowCharacterDetailViewController(of: sortedCharacters![index])
    }
}
