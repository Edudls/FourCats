//
//  SetupCollectionView.swift
//  FourQuads
//
//  Created by C02GC0VZDRJL on 12/17/18.
//  Copyright © 2018 Daniel Monaghan. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CollectionViewCell
        
        let cat = self.cats[indexPath.row]
        let data = Data(referencing: cat.imageData as NSData)
        cell.imageView.image = UIImage(data: data)
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.collectionView.frame.size.width / 2.0
        let height = self.collectionView.frame.size.height / 2.0
        return CGSize(width: width,
                      height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
