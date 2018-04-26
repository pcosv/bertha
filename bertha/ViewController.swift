//
//  ViewController.swift
//  bertha
//
//  Created by Aluno on 25/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var challengeContainer: UIView!
    
    @IBOutlet weak var chooseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        challengeContainer.layer.cornerRadius = 10
        challengeContainer.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        challengeContainer.layer.shadowOpacity = 0.7
        //challengeContainer.layer.shadowOffset = CGSize.zero
        challengeContainer.layer.shadowRadius = 5
        
        chooseButton.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

