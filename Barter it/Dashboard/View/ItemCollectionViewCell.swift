//
//  ItemCollectionViewCell.swift
//  Barter it
//
//  Created by Martin Nasierowski on 18/05/2020.
//  Copyright © 2020 Martin Nasierowski. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
}

extension UICollectionViewCell {
    func shadowDecorate(){
       contentView.layer.cornerRadius = 8
       contentView.layer.borderWidth = 1
       contentView.layer.borderColor = UIColor.clear.cgColor
       contentView.layer.masksToBounds = true

       layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
       layer.shadowOffset = CGSize(width: 0, height: 1.0)
       layer.shadowRadius = 3
       layer.shadowOpacity = 1
       layer.masksToBounds = false
       layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 8).cgPath
       layer.cornerRadius = 8
   }
}
