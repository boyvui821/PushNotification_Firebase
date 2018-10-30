//
//  Product.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation
struct Product{
    var title:String
    var cost:Double
    
    func price()->String{
        return "$ \(cost).00"
    }
}
