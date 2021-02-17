//
//  CharacterDetailCoordinatorExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 24/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

extension CharacterDetailControllerCoordinator: CharacterDetailControllerProtocol {
    
    func backToCharacterCoordinator() {
        delegate?.backToPreviousController()
    }

}
