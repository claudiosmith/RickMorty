//
//  UIFontExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 13/12/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import UIKit

extension UIFont {
    
    static var family: String {
        return "Avenir"
    }
    
    static var familyRegular: String {
        return "\(family)-Medium"
    }
    static var familyBold: String {
        return "\(family)-Black"
    }
    
    static func regular(size: CGFloat) -> UIFont {
        guard let reg = Self(name: UIFont.familyRegular, size: size) else {
            return Self.systemFont(ofSize: size)
        }
        return reg
    }
    
    static func bold(size: CGFloat) -> UIFont {
        guard let reg = Self(name: UIFont.familyBold, size: size) else {
            return Self.systemFont(ofSize: size)
        }
        return reg
    }
}
