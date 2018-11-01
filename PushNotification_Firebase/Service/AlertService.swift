//
//  AlertService.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation
import UIKit

class AlertService{
    private init(){}
    static func addProductAlert(in vc:UIViewController, completion: @escaping (Product)->Void){
        let alertController = UIAlertController(title: "New Note", message: "What 's your mind?", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Cost"
            textField.text = "0"
            textField.keyboardType = .numberPad
        }
        
        let actionPost = UIAlertAction(title: "Send", style: .default) { (alertAction) in
            guard let title = alertController.textFields?.first?.text else {return}
            guard let price = alertController.textFields?[1].text else {return}
            
            let product = Product(title: title, cost: Double(price)!)
            completion(product)
        }
        
        alertController.addAction(actionPost)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func SubcribeAlert(vc: UIViewController){
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subcribe = UIAlertAction(title: "Subcribe", style: .default) { (alertAction) in
            FIRMessagingService.shared.subcribe(to: .newProduct)
        }
        let unsubcribe = UIAlertAction(title: "UnSubcribe", style: .default) { (alertAction) in
           FIRMessagingService.shared.unsubcribe(to: .newProduct)
        }
        
        alertController.addAction(subcribe)
        alertController.addAction(unsubcribe)
        vc.present(alertController, animated: true, completion: nil)
    }
}
