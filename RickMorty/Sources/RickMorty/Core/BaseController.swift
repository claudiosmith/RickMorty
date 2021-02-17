//
//  ProfileBaseController.swift
//  Profile
//
//  Created by Claudio Smith on 18/05/20.
//  Copyright © 2020 GetNinjas. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayNavigationTitle()
    }
    
    private func displayNavigationTitle() {
        
        switch self {
            case is CharacterController:
                navigationController?.navigationBar.topItem?.title = CharacterVal.title
            case is CharacterDetailController:
                navigationItem.title = DetailVal.title
            break

            default:break
        }
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil;
    }
    
}
