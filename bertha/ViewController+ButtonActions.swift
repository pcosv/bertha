//
//  ViewController+ButtonActions.swift
//  bertha
//
//  Created by Turma Tarde on 03/05/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation

extension ViewController {
  @IBAction func chooseChallenge(_ sender: Any) {
    if challengeChosen {
        
        data.cards[self.carouselView.currentItemIndex].doing = false
        data.cards[self.carouselView.currentItemIndex].done = true
        data.updateCards()
        
        self.badgesCollectionView.reloadData()
        self.carouselView.reloadData()
      
        congratsView.isHidden = false
        self.view.addSubview(congratsView)
        blurView.isHidden = false
        chooseButton.setTitle("quero este!", for: UIControlState.normal)
      
        challengeChosen = false
    } else {
        print(self.carouselView.currentItemIndex)
        data.cards[self.carouselView.currentItemIndex].doing = true
        //data.concepts[self.carouselView.currentItemIndex].doing = true
        labelApresentacao.text = "este é seu desafio atual"
        chooseButton.setTitle("concluir", for: UIControlState.normal)
      
        challengeChosen = true
    }
  }
}
