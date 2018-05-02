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
    
    @IBOutlet weak var carouselView: iCarousel!
    // botão de escolher o desafio
    @IBOutlet weak var chooseButton: UIButton!
    // modal inferior com selos alcançados
    @IBOutlet weak var selosView: UIView!
    // elementos da célula
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var conceptTitle: UILabel!
    @IBOutlet weak var conceptBody: UILabel!
    
    var isOpen = false
    var starPressed = 0
    var data = Data(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // essa função deve receber o desafio atual e mudar as labels de acordo com o flip
    @IBAction func flipCell(_ sender: Any) {
        if isOpen {
            isOpen = false
            
            // animação de flip
            UIView.transition(with: viewCard, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            // atualização de label
            conceptTitle.text = "Titulo do conceito"
        }
        else {
            isOpen = true
            UIView.transition(with: viewCard, duration: 0.8, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            conceptTitle.text = "Titulo do desafio"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        super.awakeFromNib()
    }

    

}

