//
//  ViewController+Carousel.swift
//  bertha
//
//  Created by Marina Barros on 02/05/2018.
//  Copyright © 2018 molieres. All rights reserved.
//

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
        let tempView = UIView(frame: CGRect(x: 0, y: 0, width: 260, height: 400))
        tempView.backgroundColor = #colorLiteral(red: 0.7647058824, green: 0.9294117647, blue: 0.9215686275, alpha: 1)
        tempView.layer.cornerRadius = 10
        
        // concept title
        let conceptTitle = UILabel(frame: CGRect(x: 10, y: 50, width: 200, height: 50))
        conceptTitle.text = "Democracia"
        conceptTitle.font = UIFont.boldSystemFont(ofSize: CGFloat(20.0))
        conceptTitle.textColor = #colorLiteral(red: 0.5176470588, green: 0.2470588235, blue: 0.8274509804, alpha: 1)
        conceptTitle.numberOfLines = 0
        
        // concept body
        let conceptBody = UILabel(frame: CGRect(x: 10, y: 100, width: 200, height: 150))
        conceptBody.text = "É um tipo de governo em que todas as decisões políticas importantes estão com o povo, que elegem seus representantes por meio do voto.\nMas você sabia que as mulheres demoraram para conseguir o direito do voto?"
        conceptBody.font = UIFont.boldSystemFont(ofSize: CGFloat(16.0))
        conceptBody.textColor = #colorLiteral(red: 0.2352941176, green: 0.1921568627, blue: 0.3176470588, alpha: 1)
        conceptBody.numberOfLines = 0
        
        tempView.addSubview(conceptTitle)
        tempView.addSubview(conceptBody)
        
        return tempView
    }
}
