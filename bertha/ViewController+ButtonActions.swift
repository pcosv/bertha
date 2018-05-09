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
        
        hideViewLeft.isHidden = true
        hideViewRight.isHidden = true
        
        data.cards[self.carouselView.currentItemIndex].doing = false
        data.cards[self.carouselView.currentItemIndex].done = true
        data.updateCards()
        
        self.badgesCollectionView.reloadData()
        self.carouselView.reloadData()
      
        if chooseButton.currentTitle == "concluir" {
            points += 1
        }
        
        pointsLabel.text = "\(points)"
        
        congratsView.isHidden = false
        self.view.addSubview(congratsView)
        blurView.isHidden = false
        chooseButton.setTitle("quero este!", for: UIControlState.normal)
      
        challengeChosen = false
        giveUpButton.isHidden = true
        
        // enable scroll
        carouselView.isScrollEnabled = true
        
    } else {
        hideViewLeft.isHidden = false
        hideViewRight.isHidden = false
        
        giveUpButton.isHidden = false
      data.cards[self.carouselView.currentItemIndex].doing = true
        //data.concepts[self.carouselView.currentItemIndex].doing = true
        labelApresentacao.text = "este é seu desafio atual"
        chooseButton.setTitle("concluir", for: UIControlState.normal)
        
        // disable scroll
        carouselView.isScrollEnabled = false
        
        challengeChosen = true
    }
  }
  
  @IBAction func openGiveUpView(_ sender: Any) {
      giveUpView.isHidden = false
      self.view.addSubview(giveUpView)
      blurView.isHidden = false
  }
  
  @IBAction func giveUp(_ sender: Any) {
      data.cards[self.carouselView.currentItemIndex].doing = false
      data.updateCards()
    
      carouselView.isScrollEnabled = true
      giveUpButton.isHidden = true
    
      if(getIndexCurrentCard() < data.cards.count - 1){
        carouselView.scroll(byNumberOfItems: 1, duration: 0.5)
      }
      else {
        carouselView.scroll(byNumberOfItems: data.cards.count*(-1), duration: 0.5)
      }
    
      chooseButton.setTitle("quero este!", for: UIControlState.normal)
      challengeChosen = false
    
      giveUpView.isHidden = true
      blurView.isHidden = true
    
      hideViewLeft.isHidden = true
      hideViewRight.isHidden = true
  }
  
  @IBAction func didntGiveUp(_ sender: Any) {
      giveUpView.isHidden = true
      blurView.isHidden = true
  }
    
    
}
