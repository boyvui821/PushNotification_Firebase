//
//  UNService.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/30/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class UNService:NSObject{
    private override init() {}
    static let shared = UNService();
    let center = UNUserNotificationCenter.current()
    
    func authorize(){
        center.requestAuthorization(options: [.alert,.badge,.sound,.carPlay]) { (status, error) in
            if error != nil{
                print("--Error request UNUserNotificationCenter-- : \(error?.localizedDescription)")
            }
            DispatchQueue.main.async {
                 self.configure()
            }
        }
    }
    
    func configure(){
        center.delegate = self;
        
        let application = UIApplication.shared
        application.registerForRemoteNotifications()
    }
    
}

extension UNService:UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void){
        print("UN DID RECEIVE")
        completionHandler();
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){
         print("UN WILL PRESENT")
        completionHandler([.alert,.sound,.badge])
    }
    
    
}
