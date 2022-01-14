//
//  File.swift
//  
//
//  Created by Claudio Smith on 14/01/22.
//

import UIKit

extension UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }

}
