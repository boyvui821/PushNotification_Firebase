//
//  FIRMessagingService.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/31/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//
//CLASS NÀY DÙNG CHO GỬI PUSH NOTIFICATION  

import Foundation
import FirebaseMessaging

enum SubcriptionTopic:String{
    case newProduct = "newProducts"
}

class FIRMessagingService{
    private init(){}
    static let shared = FIRMessagingService();
    let messaging = Messaging.messaging()
    
    func subcribe(to topic: SubcriptionTopic){
        messaging.subscribe(toTopic: topic.rawValue)
    }
    
    func unsubcribe(to topic:SubcriptionTopic){
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
    
}
