//
//  BaseViewController.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    func errorButtonTouchUpInside() {
    }
    
    func showLoading(_ isShown: Bool) {
        isShown ? showSpinner(onView: self.view) : removeSpinner()
    }
    
    func showError(_ error: Error) {
        let alertMessage: String
        
        switch error {
        case .rerverError:
            alertMessage = NSLocalizedString("general.rerverError", comment: "")
        case .noInternet:
            alertMessage = NSLocalizedString("general.conectivityError", comment: "")
        }
        let okButtonText = NSLocalizedString("general.okButton", comment: "")
        
        let alertController = UIAlertController(title: "", message: alertMessage, preferredStyle: .alert)
        let ok = UIAlertAction(title: okButtonText, style: .default) { (_ action) in
            self.removeSpinner()
            self.errorButtonTouchUpInside()
        }
        ok.setValue(UIColor(cgColor: #colorLiteral(red: 0.1132610104, green: 0.1132610104, blue: 0.1132610104, alpha: 1)), forKey: "titleTextColor")
        alertController.addAction(ok)
        self.present(alertController, animated: true, completion: nil)
    }
}
