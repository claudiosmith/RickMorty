//
//  RickMortyFacade.swift
//  RickMorty
//
//  Created by Claudio Smith on 18/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

public protocol RickMortyFacadeProtocol {

    func loadRickMorty(into navigator: NavigationController?)
}

public final class RickMortyFacade: RickMortyFacadeProtocol {
    
    var coordinator: CharacterControllerCoordinator?
    
    public init() {}

    public func loadRickMorty(into navigator: NavigationController?) {
        
        guard let navigator = navigator else { return }

        coordinator = CharacterControllerCoordinator(navigator)
        coordinator?.start()
        
    }
}
