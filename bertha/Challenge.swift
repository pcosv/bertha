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
    
    init(description:String, sugestion:String, media:String, image: UIImage) {
        self.description = description
        self.sugestion = sugestion
        self.media = media
        self.image = image
    }
}
