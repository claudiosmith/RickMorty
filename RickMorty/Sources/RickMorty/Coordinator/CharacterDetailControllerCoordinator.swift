//
//  CharacterDetailControllerCoordinator.swift
//  RickMorty
//
//  Created by Claudio Smith on 24/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

protocol CharacterDetailCoordinatorProtocol: AnyObject {
    func backToPreviousController()
}

final class CharacterDetailControllerCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    var viewModel: CharacterViewModel?
    var viewData: CharacterViewData?
    
    weak var delegate: CharacterDetailCoordinatorProtocol?
    unowned let navigationController: NavigationController
    
    required init(_ navigator: NavigationController) {
        navigationController = navigator
    }
    
    func start() {
        
        let bundle = Bundle(for: RickMortyFacade.self)
        let controller = CharacterDetailController(nibName: nil, bundle: bundle)
        
        controller.viewModel = viewModel
        controller.viewdata = viewData
        controller.delegate = self
        
        controller.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(controller, animated: true)
    }
    
}
