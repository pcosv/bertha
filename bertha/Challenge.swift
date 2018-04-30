//
//  Desafio.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit
import CoreData

public class Challenge : NSManagedObject {
    @NSManaged var challenge:String
    @NSManaged var media:String
    @NSManaged var censura: Int
    @NSManaged var image:NSData
    @NSManaged var concept:Concept
    
    init(description:String, media:String, image: UIImage, concept:Concept, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Challenge", in: context)
        super.init(entity: entity!, insertInto: context)
        self.challenge = description
        self.media = media
        self.image = (UIImagePNGRepresentation(image) as NSData?)!
        self.concept = concept
    }
    
    init(description: String, media: String, censura: Int, image: UIImage, concept: Concept, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Challenge", in: context)
        super.init(entity: entity!, insertInto: context)
        self.challenge = description
        self.media = media
        self.censura = censura
        self.image = (UIImagePNGRepresentation(image) as NSData?)!
        self.concept = concept
    }
}
