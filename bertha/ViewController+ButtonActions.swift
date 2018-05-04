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
        data.cards.remove(at: currentIndex)
        data.concepts[currentIndex].doing = false
        data.concepts[currentIndex].done = true
        data.badges.append(data.concepts[currentIndex])
        data.updateCards()
      
        self.view.addSubview(congratsView)
        blurView.isHidden = false
        chooseButton.setTitle("quero este!", for: UIControlState.normal)
      
        challengeChosen = false
    } else {
        data.cards[currentIndex].doing = true
        data.concepts[currentIndex].doing = true
        labelApresentacao.text = "este é seu desafio atual"
        chooseButton.setTitle("concluir", for: UIControlState.normal)
      
        challengeChosen = true
    }
  }
}
