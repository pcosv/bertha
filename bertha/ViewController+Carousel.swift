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
        let title = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
        title.text = self.concepts[index].title
        title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
        title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
        title.numberOfLines = 0
        front.title = title
    
        // concept body
        let body = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
        body.text = self.concepts[index].concept
        body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
        body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
        body.numberOfLines = 0
        front.body = body
        
        // button turn card
        let buttonTurnCard = NewUIButton(frame: CGRect(x: 235, y: 15, width: 35, height: 35))
        buttonTurnCard.setImage(UIImage(named: "turn-left.png"), for: .normal)
        buttonTurnCard.addTarget(self, action: #selector(flipCell), for: .touchUpInside)
        buttonTurnCard.view = front
        
        //print("indice da carta = ", index)

        front.addSubview(buttonTurnCard)
        front.addSubview(title)
        front.addSubview(body)
        
        return front
    }
    
    // essa função deve receber o desafio atual e mudar as labels de acordo com o flip
    @objc func flipCell(_ sender: NewUIButton) {
        let back = sender.view
        back?.title?.isHidden = true
        back?.body?.isHidden = true

        if isOpen {
            isOpen = false
            // animação de flip
            CardUIView.transition(with: back!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)

            let title = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
            title.text = "Desafio"
            title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
            title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
            title.numberOfLines = 0
            back?.title = title
            
            let body = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
            body.text = self.concepts[carouselView.currentItemIndex].challenge.challenge
            body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
            body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
            body.numberOfLines = 0
            back?.body = body

            back?.addSubview(title)
            back?.addSubview(body)
        }
        else {
            isOpen = true
            UIView.transition(with: carouselView.currentItemView!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)

            // title
            let title = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
            title.text = self.concepts[carouselView.currentItemIndex].title
            title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
            title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
            title.numberOfLines = 0
            back?.title = title
            
            // body
            let body = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
            body.text = self.concepts[carouselView.currentItemIndex].concept
            body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
            body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
            body.numberOfLines = 0
            back?.body = body
        
            back?.addSubview(title)
            back?.addSubview(body)
        }
    }
}
