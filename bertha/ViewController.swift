//
//  ViewController.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit
// Classe principal do aplicativo

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // botão de escolher o desafio
    @IBOutlet weak var chooseButton: UIButton!
    
    // collectionview onde é implementado o carrossel
    @IBOutlet weak var carouselView: UICollectionView!
    
    // modal inferior com selos alcançados
    @IBOutlet weak var selosView: UIView!
    
    var starPressed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        carouselView.register(UINib.init(nibName: "CarouselCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "carouselIdentifier")
      
        //Context - CoreData
        let contextVC = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var data = Data(context: contextVC)
      
        // configurações do carrossel
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 60, height: carouselView.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.8
        flowLayout.sideItemAlpha = 1.0
        flowLayout.spacingMode = .fixed(spacing: 5.0)
        
        carouselView.collectionViewLayout = flowLayout
        carouselView.delegate = self
        carouselView.dataSource = self
        
        // configurações do botão de escolher desafio
        chooseButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // função que diz a quantidade de cartas (no caso, desafios)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    // função que atualiza as labels ao dar swipe na carta
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = carouselView.dequeueReusableCell(withReuseIdentifier: "carouselIdentifier", for: indexPath) as! CarouselCollectionViewCell
        // aqui deve-se guardar o desafio atual e atualizar as labels da frente da carta
        cell.conceptTitle.text = "Title - \(indexPath.row + 1)"
        cell.conceptBody.text = "Subtitle - \(indexPath.row + 1)"
        return cell
    }
    
    // função que chama pop up inferior com os selos já alcançados
    @IBAction func showLearnedConcepts(_ sender: UIButton) {
        
        if starPressed == 0{
            selosView.isHidden = false
            starPressed = 1
            // calcular largura do modal em função do tamanho da tela
            selosView.frame = CGRect(x: 0, y: 435, width: 375, height: 260)
            selosView.layer.cornerRadius = 25
            self.view.addSubview(selosView)
        } else{
            starPressed = 0
            selosView.isHidden = true
        }
 
    }
    

}

