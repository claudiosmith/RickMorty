//
//  CharacterViewConstraints.swift
//  RickMorty
//
//  Created by Claudio Smith on 24/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

extension CharacterView {
    
    func setupUI() {
        
        backgroundColor = .black
        addSubviews()
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                                  constant: CharacterVal.segmentedTop),
            segmentedControl.leftAnchor.constraint(equalTo: leftAnchor),
            segmentedControl.rightAnchor.constraint(equalTo: rightAnchor),
            segmentedControl.heightAnchor.constraint(equalToConstant: CharacterVal.segmentedHeight)
        ])

        lineview.translatesAutoresizingMaskIntoConstraints = false
        leftConstraint = lineview.leftAnchor.constraint(equalTo: segmentedControl.leftAnchor,
                                                        constant: Numbers.zeroCGFloat)
        
        NSLayoutConstraint.activate([
            lineview.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor,
                                          constant: Numbers.zeroCGFloat),
            leftConstraint, lineview.widthAnchor.constraint(equalToConstant:  CharacterVal.lineWidth),
            lineview.heightAnchor.constraint(equalToConstant: CharacterVal.lineHeight)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: lineview.bottomAnchor,
                                                constant: CharacterVal.collectionTop),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func addSubviews() {
        addSubview(collectionView)
        addSubview(segmentedControl)
        addSubview(lineview)
    }
    
}
