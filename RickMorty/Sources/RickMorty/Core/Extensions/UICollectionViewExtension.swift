//
//  UICollectionViewExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 11/12/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell(_ cell: UICollectionViewCell.Type) {
        
         register(UINib(nibName: cell.init().getClassId(), bundle: nil),
                        forCellWithReuseIdentifier: cell.init().getClassId())
    }

    func register(_ cellType: UICollectionViewCell.Type) {
         register(cellType, forCellWithReuseIdentifier: cellType.init().getClassId())
    }
    
    func reloadData(completion:@escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }

}
