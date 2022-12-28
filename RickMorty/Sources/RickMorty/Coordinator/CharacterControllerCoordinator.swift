//
//  CharacterControllerCoordinator.swift
//  RickMorty
//
//  Created by Claudio Smith on 20/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

protocol CharacterControllerProtocol: AnyObject {
    func navigateToCharacterDetails(_ viewModel: CharacterViewModel?, viewdata: CharacterViewData)
}

final class CharacterControllerCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    unowned let navigationController: NavigationController
   
    required init(_ navigator: NavigationController) {
        self.navigationController = navigator
    }
    
    func start() {
        
        let service: CharacterServiceProtocol = CharacterService()
        let cache: NSCache<NSString, UIImage> = NSCache()
        let viewModel = CharacterViewModel(service, cache: cache)
        viewModel.fetchCharacters()
        
        let bundle = Bundle(for: RickMortyFacade.self)
        let controller = CharacterController(nibName: nil, bundle: bundle)
        controller.viewModel = viewModel
        controller.delegate = self
        
        controller.hidesBottomBarWhenPushed = true
        navigationController.viewControllers = [controller]
    }
    
}
