//
//  CharacterViewData.swift
//  RickMorty
//
//  Created by Claudio Smith on 16/01/21.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

struct CharacterViewData {

    var id: String
    var name: String
    var status: Status?
    var species: String
    var imageLink: String
    var image: UIImage?
    var location: String
    var origin: String
    var favourite: Bool
    var favButtonTitle: String
}

enum Status: String {
    case dead = "Dead", alive = "Alive", unknown
    
    var color: UIColor {
        switch self {
        case .alive: return #colorLiteral(red: 0.3319556117, green: 0.8014625907, blue: 0.2689369321, alpha: 1)
            case .dead: return #colorLiteral(red: 0.8397789598, green: 0.2388118505, blue: 0.1788235903, alpha: 1)
            case .unknown: return #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
}
