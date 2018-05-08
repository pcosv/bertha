//
//  ViewController+animation.swift
//  bertha
//
//  Created by Izabella on 02/05/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation

extension ViewController {
    @objc func toBadge(){
        
        // fechando popUp
        blurView.isHidden = true
        congratsView.isHidden = true
        giveUpView.isHidden = true
        
        UIView.animate(withDuration: 0.3, animations: {
            self.selosView.frame.origin = CGPoint(x: 0, y: 2*self.view.frame.height/3)
        })
        starPressed = 1
    
        carouselView.reloadData()
        badgesCollectionView.reloadData()
    }
}
