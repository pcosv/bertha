//
//  Desafio.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation

// classe de Desafios
public class Desafio {
    var descricao:String
    var sugestao:String
    var midia:String = ""
    
    init(descricao:String, sugestao:String, midia:String) {
        self.descricao = descricao
        self.sugestao = sugestao
        self.midia = midia
    }
}
