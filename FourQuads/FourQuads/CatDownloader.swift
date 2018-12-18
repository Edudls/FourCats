//
//  CatDownloader.swift
//  FourQuads
//
//  Created by C02GC0VZDRJL on 12/17/18.
//  Copyright © 2018 Daniel Monaghan. All rights reserved.
//

import UIKit

extension ViewController {
    
    func downloadCats () {
        // download four cats using the API url and return an array of Cat objects
        
        // this url returns a different cat picture every time it's called
        let url = URL(string: "https://aws.random.cat/meow")!
        
        for _ in 1...4 {
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                let json = try! JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! [String:String]
            
                let imageURL = URL(string: json["file"]!)!
            
                URLSession.shared.dataTask(with: imageURL, completionHandler: { [unowned self] (catImage, _, _) in DispatchQueue.main.async {
                
                        let newCat = Cat(imageData: catImage!)
                        self.cats.append(newCat)
                        self.collectionView.reloadData()
                    }
                }).resume()
            }.resume()
        }
    }
}

