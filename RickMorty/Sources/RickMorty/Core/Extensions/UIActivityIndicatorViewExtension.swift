//
//  UIActivityIndicatorViewExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 12/12/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import UIKit

public extension UIActivityIndicatorView {

    func show(_ shouldShow: Bool, at subview: UIView? = nil) {

        guard subview != nil else {
            guard let frontWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
            create(in: frontWindow)
            show(shouldShow)
            return
        }

        guard let subview = subview else { return }
        createSubview(in: subview)
        show(shouldShow)
    }

    private func show( _ shouldShow: Bool) {

        guard shouldShow == false else {
            startAnimating()
            isHidden = false
            return
        }
        removeFromSuperview()
    }

    func create(at subview: UIView? = nil) {
        guard subview != nil else {
           guard let frontWindow = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first else { return }
           create(in: frontWindow)
           return
        }

        guard let subview = subview else { return }
        createSubview(in: subview)
    }

    private func create(in containerView: UIView) {
        center = containerView.center
        containerView.addSubview(self)
        setup()
    }

    private func createSubview(in containerView: UIView) {
        containerView.addSubview(self)

        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        setup()
        isHidden = false
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
        style = .large
        if #available(iOS 13.0, *) {
            style = .medium
        } else {
            style = .gray
        }
    }
    
}
