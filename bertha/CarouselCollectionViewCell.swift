//
//  CarouselCollectionViewCell.swift
//  bertha
//
//  Created by Aluno on 26/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit

// Classe que contém a célula do carrossel, no caso, cada cartinha
class CarouselCollectionViewCell: UICollectionViewCell {

    // elementos da célula
    @IBOutlet weak var viewCard: UIView!
    @IBOutlet weak var conceptTitle: UILabel!
    @IBOutlet weak var conceptBody: UILabel!
    
    var isOpen = false
    
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
        
        DispatchQueue.main.async {
            self.viewCard.layer.cornerRadius = 10
            self.viewCard.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.viewCard.layer.opacity = 10.0
            self.viewCard.layer.shadowOffset = .zero
            self.viewCard.layer.shadowPath = UIBezierPath(rect: self.viewCard.bounds).cgPath
            self.viewCard.layer.shouldRasterize = true
            
            // Paulinha, mudei aqui
            let maxSize = CGSize(width: 265, height: 300)
            let size = self.conceptTitle.sizeThatFits(maxSize)
            self.conceptTitle.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)


        }
    }

}
