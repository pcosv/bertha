//
//  Data.swift
//  bertha
//
//  Created by Turma Tarde on 30/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation
import CoreData

class Data {
  
  var context: NSManagedObjectContext
  var concepts: [Concept]
  var challenges: [Challenge]
  
  init(context: NSManagedObjectContext) {
    self.context = context
    self.concepts = [
      Concept(title: "Democracia", description: "É um tipo de governo em que todas as decisões políticas importantes estão com o povo, que elegem seus representantes por meio do voto.\nMas você sabia que as mulheres demoraram para conseguir o direito do voto?", context: context)
    ]
    self.challenges = [
      Challenge(description: "Assista o filme As Sufragistas, que narra a história das mulheres que enfrentaram seus limites na luta por igualdade e pelo direito de voto. [12 ANOS]", media: "", image: #imageLiteral(resourceName: "star"), concept: concepts[0], context: context)
    ]
  }
  
}
