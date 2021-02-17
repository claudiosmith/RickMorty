//
//  DetailViewConstraints.swift
//  RickMorty
//
//  Created by Claudio Smith on 27/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

extension CharacterDetailView {
    
    func addSubViews() {
        
        addSubview(rickyImage)
        addSubview(boxView)

        boxView.addSubview(nameLabel)
        boxView.addSubview(ballColor)
        boxView.addSubview(statusLabel)
        boxView.addSubview(originLabel)
        boxView.addSubview(locationLabel)
        boxView.addSubview(originTitleLabel)
        boxView.addSubview(locationTitleLabel)
    }

    func setupUI() {

        backgroundColor = .black
        addSubViews()
        setupBoxView()

        let width: CGFloat = UIScreen.main.bounds.width
        rickyImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rickyImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                            constant: DetailVal.topMargin),
            rickyImage.leftAnchor.constraint(equalTo: leftAnchor),
            rickyImage.widthAnchor.constraint(equalToConstant: width),
            rickyImage.heightAnchor.constraint(equalToConstant: width),
        ])
        
        boxView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boxView.topAnchor.constraint(equalTo: rickyImage.bottomAnchor, constant: DetailVal.boxTopMargin),
            boxView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: DetailVal.boxMargin),
            boxView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -DetailVal.boxMargin),
            boxView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -DetailVal.boxBottomMargin),
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: boxView.topAnchor, constant: DetailVal.margin),
            nameLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            nameLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            nameLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])
        
        ballColor.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ballColor.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: DetailVal.ballTopMargin),
            ballColor.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            ballColor.heightAnchor.constraint(equalToConstant: DetailVal.ballRadius),
            ballColor.widthAnchor.constraint(equalTo: ballColor.heightAnchor, multiplier: Numbers.oneCGFloat)
        ])
       
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusLabel.centerYAnchor.constraint(equalTo: ballColor.centerYAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: ballColor.trailingAnchor,
                                                 constant: DetailVal.statusAlignLeading),
            statusLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            statusLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])

        originTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            originTitleLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: DetailVal.topTitleMargin),
            originTitleLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            originTitleLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            originTitleLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])
       
        originLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            originLabel.topAnchor.constraint(equalTo: originTitleLabel.bottomAnchor, constant: DetailVal.topMargin),
            originLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            originLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            originLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])
       
        locationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationTitleLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: DetailVal.topTitleMargin),
            locationTitleLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            locationTitleLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            locationTitleLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])
       
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: DetailVal.topMargin),
            locationLabel.leadingAnchor.constraint(equalTo: boxView.leadingAnchor, constant: DetailVal.margin),
            locationLabel.trailingAnchor.constraint(equalTo: boxView.trailingAnchor, constant: DetailVal.margin),
            locationLabel.heightAnchor.constraint(equalToConstant: DetailVal.labelHeight),
        ])
    }
    
}
