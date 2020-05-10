//
//  UIViewController + Spinner.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 10/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

var spinner: UIView?

extension UIViewController {
    func showSpinner(onView: UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        indicator.color = UIColor.white
        indicator.startAnimating()
        indicator.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(indicator)
            onView.addSubview(spinnerView)
        }
        
        spinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            spinner?.removeFromSuperview()
            spinner = nil
        }
    }
}
