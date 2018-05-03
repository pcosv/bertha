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
        
        blurView.isHidden = true
        let path = UIBezierPath()
        
        let imageTest = UIImage(named: "coldwar.png")
        let imageView = UIImageView(image: imageTest)
        
        path.move(to: CGPoint(x: view.frame.midX, y: view.frame.midY))
        path.addQuadCurve(to: CGPoint(x: view.frame.maxX/3, y: view.frame.maxY - imageView.frame.height/2), controlPoint: CGPoint(x:view.frame.maxX/2, y: 0))
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.repeatCount = 0
        animation.duration = 2.0
        imageView.layer.add(animation, forKey: "animate along path")
        imageView.center = CGPoint(x: view.frame.maxX/3, y: view.frame.maxY - imageView.frame.height/2)
        
        view.addSubview(imageView)
    }
}
