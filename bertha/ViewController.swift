//
//  ViewController.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit
// Classe principal do aplicativo

class ViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {
    
    // carousel
    @IBOutlet weak var carouselView: iCarousel!
    
    // botão de escolher o desafio
    @IBOutlet weak var chooseButton: UIButton!
    
    // modal inferior com selos alcançados
    @IBOutlet weak var selosView: UIView!
    
    var challenges = [Challenge]()
    var concepts = [Concept]()

    
    // elementos da célula
    
    var isOpen = true
    var starPressed = 0
    var data = Data(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.updateCards()
        concepts = data.cards
        // view de selos
        selosView.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height/3)
        selosView.layer.cornerRadius = 15
        selosView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        self.view.addSubview(selosView)
        
        // configurações do botão de escolher desafio
        chooseButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfItems(in carousel: iCarousel) -> Int {
        //return numbers.count
        data.updateCards()
        return data.cards.count
    }
    
    // função que chama pop up inferior com os selos já alcançados
    @IBAction func showLearnedConcepts(_ sender: UIButton) {
        
        if starPressed == 0{
            starPressed = 1
            
            // subir
            UIView.animate(withDuration: 0.3, animations: {
                self.selosView.frame.origin = CGPoint(x: 0, y: 2*self.view.frame.height/3)
            })
            
        }
        else {
            starPressed = 0
            
            // descer
            UIView.animate(withDuration: 0.3, animations: {
                self.selosView.frame.origin = CGPoint(x: 0, y: self.view.frame.maxY)
            })
        }
 
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        super.awakeFromNib()
    }

    

}

