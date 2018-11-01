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
    
    init(title:String, cost:Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String:Any]){
        guard let title = valueDict["title"] as? String,
            let cost = valueDict["cost"] as? Double else {return nil}
        
        self.title = title
        self.cost = cost
    }
    
    func price()->String{
        return "$ \(cost).00"
    }
    
    func parameters() -> [String:Any]{
        return ["title": self.title,"cost": self.cost]
    }
}
