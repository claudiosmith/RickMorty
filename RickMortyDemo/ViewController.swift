//
//  ViewController.swift
//  RickMortyDemo
//
//  Created by Claudio Smith on 16/02/2021.
//

import UIKit
import RickMorty

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navigationController = navigationController as? NavigationController else { return }
        RickMortyFacade().loadRickMorty(into: navigationController)
    }
    
}
