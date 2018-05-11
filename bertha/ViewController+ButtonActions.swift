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
        if points == 10{
            chooseButton.isHidden = true
            let a = self.view.frame.width*0.05
            let b = self.view.frame.height*0.35
            let c = self.view.frame.width*0.9
            let d = self.view.frame.height*0.30
            let end = UIView(frame: CGRect(x: a, y: b, width: c, height: d))
            end.backgroundColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
            end.layer.cornerRadius = 10
            
            let congratulations = UILabel(frame: CGRect(x: a, y: b, width: c, height: d))
            congratulations.text = "Parabéns! Você concluiu todos os desafios! Esperamos tê-la ajudado em sua jornada político cidadã!"
            congratulations.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            congratulations.textAlignment = .center
            congratulations.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
            congratulations.numberOfLines = 0
            
            end.addSubview(congratulations)
            
            self.view.addSubview(end)
            self.view.addSubview(congratulations)
        }
        labelApresentacao.text = "escolha seu desafio"
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
        labelApresentacao.text = "este é seu desafio atual!"
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
    
      labelApresentacao.text = "escolha seu desafio"
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
