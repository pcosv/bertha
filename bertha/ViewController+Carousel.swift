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
        
        let front = CardUIView(frame: CGRect(x: 0, y: 0, width: carouselView.frame.width * 0.75, height: carouselView.frame.height))
        front.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.9294117647, blue: 0.9215686275, alpha: 1)
        front.layer.cornerRadius = 10
        front.layer.shadowColor = UIColor.black.cgColor
        front.layer.shadowOpacity = 0.3
        front.layer.shadowOffset = CGSize(width: 0, height: 5)
        front.layer.shadowRadius = 5

        // concept title
        let title = UILabel(frame: CGRect(x: carousel.frame.width*0.04, y: carousel.frame.height*0.05, width: front.frame.width*0.9, height: front.frame.height*0.15))
        title.text = self.data.cards[index].title
        title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
        title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
        title.numberOfLines = 0
        front.title = title
    
        // concept body
        let body = UILabel(frame: CGRect(x: carousel.frame.width*0.04, y: carousel.frame.height*0.18, width: front.frame.width*0.9, height: front.frame.height*0.75))
        body.text = self.data.cards[index].concept
        body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
        body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
        body.numberOfLines = 0
        front.body = body
        
        // button turn card
        let temp = front.frame.height*0.09
        let buttonTurnCard = NewUIButton(frame: CGRect(x: carousel.frame.width*0.63, y: carousel.frame.height*0.04, width: temp, height: temp))
        buttonTurnCard.setImage(UIImage(named: "turn-left.png"), for: .normal)
        buttonTurnCard.addTarget(self, action: #selector(flipCell), for: .touchUpInside)
        buttonTurnCard.view = front
    
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

        if (back?.isOpen)! {
            back?.isOpen = false
            // animação de flip
            CardUIView.transition(with: back!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)

            let title = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
            title.text = "Desafio"
            title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
            title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
            title.numberOfLines = 0
            back?.title = title
            
            let body = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
            body.text = self.data.cards[carouselView.currentItemIndex].challenge.challenge
            body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
            body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
            body.numberOfLines = 0
            back?.body = body

            back?.addSubview(title)
            back?.addSubview(body)
        }
        else {
            back?.isOpen = true
            UIView.transition(with: carouselView.currentItemView!, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)

            // title
            let title = UILabel(frame: CGRect(x: 15, y: 20, width: 250, height: 50))
            title.text = self.data.cards[carouselView.currentItemIndex].title
            title.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
            title.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
            title.numberOfLines = 0
            back?.title = title
            
            // body
            let body = UILabel(frame: CGRect(x: 15, y: 70, width: 250, height: 250))
            body.text = self.data.cards[carouselView.currentItemIndex].concept
            body.font = UIFont.boldSystemFont(ofSize: CGFloat(15.0))
            body.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
            body.numberOfLines = 0
            back?.body = body
        
            back?.addSubview(title)
            back?.addSubview(body)
        }
    }
}
