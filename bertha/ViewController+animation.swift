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
        
        UIView.animate(withDuration: 0.3, animations: {
            self.selosView.frame.origin = CGPoint(x: 0, y: 2*self.view.frame.height/3)
        })
        starPressed = 1
        
//        let path = UIBezierPath()
//
//        var conceptDoing:String = ""
//
//        for card in data.concepts {
//            if card.done {
//                print("fazendo -> ", card.title)
//                conceptDoing = card.title
//                break
//            }
//        }
        
        /*let imageStr = conceptDoing + ".png"
        let imageConcept = UIImage(named: imageStr)
        let imageConceptView = UIImageView(image: imageConcept)
        
        path.move(to: CGPoint(x: view.frame.midX, y: view.frame.midY))
        path.addQuadCurve(to: CGPoint(x: view.frame.maxX/3, y: view.frame.maxY - imageConceptView.frame.height/2), controlPoint: CGPoint(x:view.frame.maxX/2, y: 0))
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.repeatCount = 0
        animation.duration = 2.0
        imageConceptView.layer.add(animation, forKey: "animate along path")
        imageConceptView.center = CGPoint(x: view.frame.maxX/3, y: view.frame.maxY - imageConceptView.frame.height/2)
        
        view.addSubview(selosView)
        view.addSubview(imageConceptView)
        //selosView.addSubview(imageConceptView)
        */
        //UIView.animate(withDuration: 0.3, animations: {
        //    self.selosView.frame.origin = CGPoint(x: 0, y: self.view.frame.maxY)
        //})
        carouselView.reloadData()
        badgesCollectionView.reloadData()
    }
}
