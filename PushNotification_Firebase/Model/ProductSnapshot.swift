//
//  ProductSnapshot.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation
import Firebase

struct  ProductSnapshot{
    let listProducts:[Product]
    
    init?(snapshot:DataSnapshot) {
        guard let snapdict = snapshot.value as? [String:[String:Any]] else {return nil}
        var products = [Product]()
        
        for snap in snapdict{
            let dict = snap.value
            let product = Product(valueDict: dict)
            products.append(product!)
        }
        
        listProducts = products
    }
}
