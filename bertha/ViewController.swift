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
  
    //Label de apresentação do app
    @IBOutlet weak var labelApresentacao: UILabel!
  
    // botão de escolher o desafio
    @IBOutlet weak var chooseButton: UIButton!
    
    // modal inferior com selos alcançados
    @IBOutlet weak var selosView: UIView!
  
    // modal de parabéns quando o usuário conclui um desafio
    @IBOutlet weak var congratsView: UIView!
    
    // botão ok do modal de parabéns
    @IBOutlet weak var congratsButton: UIButton!
    
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var badgesCollectionView: UICollectionView!
  
    var challenges = [Challenge]()
    var concepts = [Concept]()
    var challengeChosen = false
    var currentIndex = 0
    
    // elementos da célula
    
    var starPressed = 0
    var data = Data(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data.updateCards()
        concepts = data.cards
        
        blurView.isHidden = true
        
        // view de selos
        selosView.frame = CGRect(x: 0, y: view.frame.maxY, width: view.frame.width, height: view.frame.height/3)
        selosView.layer.cornerRadius = 15
        selosView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
      
        //Config badges view
        badgesCollectionView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        badgesCollectionView.layer.cornerRadius = 10
        badgesCollectionView.dataSource = self
        badgesCollectionView.delegate = self
      
        selosView.addSubview(badgesCollectionView)

        
        // configurações do botão de escolher desafio
        chooseButton.layer.cornerRadius = 10
        
        congratsView.frame = CGRect(x: view.frame.midX - 150, y: view.frame.midY - 90, width: 300, height: 180)
        congratsView.layer.cornerRadius = 10
        congratsButton.addTarget(self, action: #selector(toBadge), for: .touchUpInside)
        congratsButton.layer.cornerRadius = 10
        
        self.view.addSubview(selosView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
  
    func isDoingChallenge() -> Bool {
      for card in data.cards {
        if card.doing {
          return true
        }
      }
      return false
    }

    

}

