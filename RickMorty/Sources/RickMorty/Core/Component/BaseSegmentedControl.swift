//
//  SegmentedControl.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

class BaseSegmentedControl: UISegmentedControl {
       
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setFont()
        setBackgroundColor()
    }

    private func setBackgroundColor() {
        backgroundColor = .black
        selectedSegmentTintColor = .black
    }
    
    private func setFont() {
        let fontNormal = [NSAttributedString.Key.font: UIFont.regular(size: Numbers.segmentedFontSize),
                          NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)] as [NSAttributedString.Key : Any]

        setTitleTextAttributes(fontNormal, for: .normal)
        
        let fontSelected = [NSAttributedString.Key.font: UIFont.bold(size: Numbers.segmentedFontSize),
                            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)] as [NSAttributedString.Key : Any]
        
        setTitleTextAttributes(fontSelected, for: .selected)
    }
}

extension UISegmentedControl {
    
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: backgroundColor ?? .clear), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: .black), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal,
                        rightSegmentState: .normal, barMetrics: .default)
    }

    private func imageWithColor(color: UIColor) -> UIImage {
        
        let rect = CGRect(x: Numbers.zeroCGFloat, y: Numbers.zeroCGFloat,
                          width: Numbers.oneCGFloat, height: Numbers.oneCGFloat)
        UIGraphicsBeginImageContext(rect.size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
