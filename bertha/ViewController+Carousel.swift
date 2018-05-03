//
//  ViewController+Carousel.swift
//  bertha
//
//  Created by Marina Barros on 02/05/2018.
//  Copyright © 2018 molieres. All rights reserved.

import Foundation

extension ViewController {
   
    func getIndexCurrentCard() -> Int {
        return carouselView.currentItemIndex
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option == iCarouselOption.spacing{
            return value * 1.1
        }
        return value
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        let front = CardUIView(frame: CGRect(x: 0, y: 0, width: 280, height: 420))
        front.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.9294117647, blue: 0.9215686275, alpha: 1)
        front.layer.cornerRadius = 10

        
        // concept title
        let conceptTitle = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
        conceptTitle.text = self.concepts[getIndexCurrentCard()].title
        conceptTitle.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
        conceptTitle.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
        conceptTitle.numberOfLines = 0
        
        // concept body
        let conceptBody = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
        conceptBody.text = self.concepts[getIndexCurrentCard()].concept
        conceptBody.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
        conceptBody.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
        conceptBody.numberOfLines = 0
        
        // button turn card
        let buttonTurnCard = NewUIButton(frame: CGRect(x: 235, y: 15, width: 35, height: 35))
        buttonTurnCard.setImage(UIImage(named: "turn-left.png"), for: .normal)
        buttonTurnCard.addTarget(self, action: #selector(flipCell), for: .touchUpInside)
        buttonTurnCard.view = front
        

        front.addSubview(buttonTurnCard)
        front.addSubview(conceptTitle)
        front.addSubview(conceptBody)
        
        return front
    }
    
    // essa função deve receber o desafio atual e mudar as labels de acordo com o flip
    @objc func flipCell(_ sender: NewUIButton) {
        var back = sender.view

        if isOpen {
            isOpen = false
            // animação de flip
            // CardUIView.transition(with: carouselView.currentItemView!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            CardUIView.transition(from: carouselView.currentItemView!, to: back!, duration: 0.8, options: .transitionFlipFromLeft, completion: nil)
            
            //print(carouselView.currentItemView!)
            back?.conceptTitle?.text = "Desafio"
//            back.frame = CGRect(x: 15, y: 20, width: 250, height: 50)
//            back.conceptTitle?.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
//            back.conceptTitle?.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
//            back.conceptTitle?.numberOfLines = 0

            self.view.addSubview(back!)
            //tempView.challengeBody?.text = concepts[getIndexCurrentCard()].challenge.challenge
        }
        else {
            isOpen = true
            UIView.transition(with: carouselView.currentItemView!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)

        }
    }
}
