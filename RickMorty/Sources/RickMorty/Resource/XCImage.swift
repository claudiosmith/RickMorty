//
//  XCImage.swift
//  
//
//  Created by Claudio Smith on 16/02/2021.
//

import UIKit

public func XCImage(named name: String) -> UIImage? {
    UIImage(named: name, in: Bundle.module, compatibleWith: nil)
}
