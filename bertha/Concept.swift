//
//  Concept.swift
//  bertha
//
//  Created by Aluno on 26/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation
import CoreData

class Concept : NSManagedObject {
    @NSManaged var title:String
    @NSManaged var concept:String
    @NSManaged var challenge: Challenge
    @NSManaged var done: Bool
    
    convenience init(title: String, description: String, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Concept", in: context)
        self.init(entity: entity!, insertInto: context)
        self.title = title
        self.concept = description
        self.done = false
    }
}
