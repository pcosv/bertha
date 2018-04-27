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
    @IBOutlet weak var viewteste: UIView!
    @IBOutlet weak var labelteste1: UILabel!
    @IBOutlet weak var labelteste2: UILabel!
    
    var isOpen = false
    
    @IBAction func flipCell(_ sender: Any) {
        if isOpen {
            isOpen = false
            
            // animação de flip
            UIView.transition(with: viewteste, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            // atualização de label
            labelteste1.text = "VERSO"
        }
        else {
            isOpen = true
            UIView.transition(with: viewteste, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
            labelteste1.text = "FRENTE"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DispatchQueue.main.async {
            self.viewteste.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            self.viewteste.layer.opacity = 0.5
            self.viewteste.layer.opacity = 10.0
            self.viewteste.layer.shadowOffset = .zero
            self.viewteste.layer.shadowPath = UIBezierPath(rect: self.viewteste.bounds).cgPath
            self.viewteste.layer.shouldRasterize = true



        }
    }

}
