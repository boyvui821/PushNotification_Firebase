//
//  FIRDatabaseService.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation
import Firebase

enum eDatabaseRefType:String{
    case products = "products"
}

class FIRDatabaseService{
    private init(){}
    static let shared = FIRDatabaseService();
    
    let database = Database.database().reference()
    
    func reference(_ databaseRef:eDatabaseRefType) -> DatabaseReference{
        return Database.database().reference().child(databaseRef.rawValue)
    }
    
    func observe(_ databaseRef: eDatabaseRefType, completion: @escaping (DataSnapshot)->Void){
        reference(databaseRef).observe(.value) { (snapshot) in
            completion(snapshot)
        }
    }
    
    func post(parameters: [String:Any], to databaseRef:eDatabaseRefType){
        reference(databaseRef).childByAutoId().setValue(parameters)
    }
}
