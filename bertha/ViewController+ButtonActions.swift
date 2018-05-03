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
        //Animação
      
        challengeChosen = false
    } else {
        labelApresentacao.text = "este é seu desafio atual"
        chooseButton.titleLabel?.text = "Concluir"
      
        challengeChosen = true
    }
  }
}
