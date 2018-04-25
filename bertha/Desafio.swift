//
//  Desafio.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation

public class Challenge {
    var description:String
    var sugestion:String
    var media:String = ""
    
    init(description:String, sugestion:String, media:String) {
        self.description = description
        self.sugestion = sugestion
        self.media = media
    }
}
