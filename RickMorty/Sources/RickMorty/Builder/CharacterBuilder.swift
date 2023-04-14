//  CharacterBuilder.swift
//  RickyMorty
//
//  Created by Claudio Smith on 15/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

protocol CharacterBuilderProtocol {
    mutating func set(using data: [Character], favourites: [CharacterViewData]) -> Self
    var characterList: [CharacterViewData]? { get set }
}

extension CharacterBuilderProtocol {

    mutating func set(using data: [Character], favourites: [CharacterViewData]) -> Self {
        loadCharacter(data, favourites)
        return self
    }

    private mutating func loadCharacter(_ data: [Character], _ favourites: [CharacterViewData]?) {

        data.forEach { element in
            
            let id = String(element.id)
            let isFavourite = readFavourite(id, favourites)
            let character = CharacterViewData(id: id,
                                              name: element.name,
                                              status: getStatus(statusText: element.status),
                                              species: element.species,
                                              imageLink: element.image,
                                              image: nil,
                                              location: element.location.name,
                                              origin: element.origin.name,
                                              favourite: isFavourite,
                                              favButtonTitle: setFavButtonTitle(isFavourite))
            characterList?.append(character)
        }
    }

    func setFavButtonTitle(_ isFavourite: Bool) -> String {
        let title = isFavourite == true ? CharacterVal.buttonTitleFav :
                                          CharacterVal.buttonTitle
        return title
    }
    
    private func getStatus(statusText: String) -> Status? {
        guard let status = Status(rawValue: statusText) else {
            return nil
        }
        return status
    }
    
    private func readFavourite(_ id: String, _ favourites: [CharacterViewData]?) -> Bool {
        guard let ind = favourites?.firstIndex( where: { $0.id == id }), let isFavourite = favourites?[ind].favourite else {
              return false
        }
        return isFavourite
    }
    
    func build() -> [CharacterViewData]? {
        return characterList
    }
}

struct CharacterBuilder: CharacterBuilderProtocol {
    var characterList: [CharacterViewData]?

    init() {
        characterList = [CharacterViewData]()
    }
}
