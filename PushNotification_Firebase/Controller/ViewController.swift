//
//  ViewController.swift
//  PushNotification_Firebase
//
//  Created by Nguyen Hieu Trung on 10/29/18.
//  Copyright © 2018 OneSignal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionViewProduct: UICollectionView!
    
    var listProducts = [Product]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewProduct.delegate = self;
        collectionViewProduct.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listProducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "ReuseCell", for: indexPath) as! ProductCell;
        
        var product = listProducts[indexPath.row];
        cell.configure(with: product)
        return cell;
        
    }
    
    
}

