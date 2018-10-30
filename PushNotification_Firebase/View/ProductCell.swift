//
//  ProductCell.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtCost: UILabel!
    
    func configure(with product:Product){
        txtTitle.text = product.title
        txtCost.text = product.price()
    }
}
