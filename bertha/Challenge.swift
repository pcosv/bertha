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
    @NSManaged var suggestion:String
    @NSManaged var media:String
    @NSManaged var image:NSData
    @NSManaged var concept:Concept
    
    init(description:String, sugestion:String, media:String, image: UIImage, concept:Concept, context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "Challenge", in: context)
        super.init(entity: entity!, insertInto: context)
        self.challenge = description
        self.suggestion = sugestion
        self.media = media
        self.image = UIImagePNGRepresentation(image) as NSData!
        self.concept = concept
    }
}
