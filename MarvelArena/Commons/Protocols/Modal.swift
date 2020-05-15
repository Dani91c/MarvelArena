//
//  Modal.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 13/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import UIKit

protocol Modal {
    var backgroundView: UIView! { get }
    var popupView: UIView! { get set }
    func show(in view: UIView)
    func dismiss()
}

extension Modal where Self: UIView {
    
    func show(in view: UIView) {
        
        self.backgroundView.alpha = 0
        self.popupView.center = CGPoint(x: self.center.x, y: self.frame.height + self.popupView.frame.height/2)
        view.addSubview(self)
        
        UIView.animate(withDuration: 0.33, animations: {
            self.backgroundView.alpha = 0.7
        })
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: UIView.AnimationOptions(rawValue: 0), animations: {
            self.popupView.center = self.center
        })
    }
    
    func dismiss() {

        UIView.animate(withDuration: 0.33, animations: {
            self.alpha = 0
        }, completion: { (_) in
            self.removeFromSuperview()
        })
    }
}
