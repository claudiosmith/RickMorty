//
//  UIActivityIndicatorViewExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 12/12/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
    
    func create() {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let frontWindow = keyWindow else { return }
        center = frontWindow.center
        frontWindow.addSubview(self)
        setup()
    }

    func start() {
        guard isAnimating == false else { return }
        isHidden = false
        startAnimating()
    }

    func stop() {
        stopAnimating()
        isHidden = true
    }

    func setup() {
        isHidden = true
        if #available(iOS 13.0, *) {
            self.style = .medium
        } else {
            self.style = .gray
        }
    }
    
}
