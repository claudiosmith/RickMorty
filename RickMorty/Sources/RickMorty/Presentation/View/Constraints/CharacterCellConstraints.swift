//
//  CharacterCellConstraints.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

extension CharacterCell {
    
    func setupViews() {
        
        addViews()
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                      constant: Numbers.topFav),
            favButton.heightAnchor.constraint(equalToConstant: Numbers.heightFav),
            favButton.widthAnchor.constraint(equalTo: favButton.heightAnchor,
                                             constant: Numbers.oneCGFloat),
            favButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                          constant: Numbers.leftFav),
        ])
        
        rickyImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            rickyImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                      constant: Numbers.zeroCGFloat),
            rickyImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,
                                      constant: Numbers.zeroCGFloat),
            rickyImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,
                                          constant: Numbers.zeroCGFloat),
            rickyImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Numbers.zeroCGFloat),
        ])
        
        bringSubviewToFront(favButton)
    }
    
    private func addViews() {
        addSubview(favButton)
        addSubview(rickyImage)
    }
}
