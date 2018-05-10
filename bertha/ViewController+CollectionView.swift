//
//  ViewController+CollectionView.swift
//  bertha
//
//  Created by Turma Tarde on 03/05/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.updateCards()
        return data.badges.count
    }
  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        data.updateCards()
        var cell:BadgeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellBadge", for: indexPath) as! BadgeCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.title.text = data.badges[indexPath.row].title
        cell.title.adjustsFontSizeToFitWidth = true
        cell.image.image = UIImage(data: data.badges[indexPath.row].challenge.image as Foundation.Data)
        return cell
    }
    
}
