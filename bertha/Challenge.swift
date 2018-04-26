//
//  Desafio.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit

public class Challenge {
    var description:String
    var sugestion:String = ""
    var media:String = ""
    var image:UIImage
    var concept:Concept
    
    init(description:String, sugestion:String, media:String, image: UIImage, concept:Concept) {
        self.description = description
        self.sugestion = sugestion
        self.media = media
        self.image = image
        self.concept = concept
    }
}
