//
//  DownloadService.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 11/1/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import Foundation

public class DownloadService{
    private init(){}
    static let shared = DownloadService();
    
    func DownloadImage(with strUrl: String, completeHandle: @escaping (URL)->Void){
        guard let url = URL(string: strUrl) else {return}
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            let fileManager = FileManager.default
            guard let data = data, let documentUrl = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else{
                return
            }
            
            //Tạo đường dẫn tới thư mục chứa file
            let fileUrl = documentUrl.appendingPathComponent("image.jpg")
            //Ghi dữ liệu vào thư mục
            do{
                try data.write(to: fileUrl)
                DispatchQueue.main.async {
                    completeHandle(fileUrl)
                }
            }catch{
                print("Error Download Image: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
}
