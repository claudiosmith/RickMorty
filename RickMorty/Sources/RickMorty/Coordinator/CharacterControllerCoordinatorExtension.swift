//
//  CharacterControllerCoordinatorExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 16/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

extension CharacterControllerCoordinator: CharacterControllerProtocol {
    
    func navigateToCharacterDetails(_ viewModel: CharacterViewModel?, viewdata: CharacterViewData) {
        
        let coordinator = CharacterDetailControllerCoordinator(navigationController)
        coordinator.delegate = self
        coordinator.viewData = viewdata
        coordinator.viewModel = viewModel
        
        childCoordinators.append(coordinator)
        coordinator.start()
    }

}

extension CharacterControllerCoordinator: CharacterDetailCoordinatorProtocol {

    func backToPreviousController() {
        
        navigationController.popToRootViewController(animated: true)
        childCoordinators.removeLast()
    }
}
