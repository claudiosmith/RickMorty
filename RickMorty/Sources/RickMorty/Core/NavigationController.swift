//
//  File.swift
//  
//
//  Created by Claudio Smith on 16/02/2021.
//

import UIKit

public final class NavigationController: UINavigationController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setFont()
        setupNavigationController()
    }
    
    func setFont() {
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                             NSAttributedString.Key.font: UIFont.regular(size: Numbers.titleFontSize)]
    }
    
    func setupNavigationController() {
        hidesBottomBarWhenPushed = true
        navigationBar.barTintColor = #colorLiteral(red: 0.01901422255, green: 0.01893483661, blue: 0.02233588509, alpha: 1)
        navigationBar.isTranslucent = false
    }
}
