//
//  Constants.swift
//  RickMorty
//
//  Created by Claudio Smith on 13/01/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import Foundation
import UIKit

struct Endpoint {
    static let scheme = "https"
    static let host = "rickandmortyapi.com"
    static let path = "/api/character"
    static let character = "https://rickandmortyapi.com/api/character/"
}

struct Query {
    static let page = "page"
}

struct Constants {
    static let backgroundAlert = #colorLiteral(red: 0.1729443916, green: 0.1617187862, blue: 0.1567400009, alpha: 0.9065263856)
    static let json = "json"
    static let fileNotFound = "couldn't find the file"
    static let emptyString = ""
    static let cancel = "Cancelar"
    static let sort = "Ordenar"
    static let filter = "Filtrar"
    static let ok = "Ok"
    static let minStatusSuccess = 200
    static let maxStatusSuccess = 300
    static let errorMessageCorrupted = "Dados ausentes ou corrompidos."
}

struct Numbers {
    static let topFav: CGFloat = 5
    static let leftFav: CGFloat = 5
    static let heightFav: CGFloat = 40
    static let zeroCGFloat: CGFloat = 0
    static let zeroInt: Int = 0
    static let zeroFloat: Float = 0
    static let oneFloat: Float = 0
    static let zeroDuration: TimeInterval = 0
    static let zeroDouble: Double = 0
    static let oneInt: Int = 1
    static let oneCGFloat: CGFloat = 1
    static let oneNumber: NSNumber = 1
    static let titleFontSize: CGFloat = 18
    static let filterFontSize: CGFloat = 17
    static let errorCodePermission = 999
    static let buttonCornerRadius: CGFloat = 25
    static let buttonBorderWidth: CGFloat = 0.5
    static let segmentedFontSize: CGFloat = 16
    static let half: CGFloat = 2
}

struct Assets {
    static let arrowLeft = "arrowLeft"
}

struct Plist {
    static let favouriteFilename = "favourites"
    static let `extension` = "plist"
    static let errorMessage = "Erro ao buscar url do arquivo plist"
}

struct CharacterVal {
    static let title = "Characters"
    static let firstSegment = "All"
    static let secondSegment = "Favorites"
    static let buttonTitleFav = "❤️"
    static let buttonTitle = "🤍"
    static let favoriteSize: CGFloat = 30
    static let segmentedHeight: CGFloat = 50
    static let segmentedTop: CGFloat = 5
    static let lineWidth: CGFloat = 180
    static let lineLeading: CGFloat = 2
    static let lineExtraLeading: CGFloat = 4
    static let lineHeight: CGFloat = 2
    static let collectionTop: CGFloat = 10
    static let duration: TimeInterval = 0.2
    static let reduceWidth: CGFloat = 0.98
}

struct DetailVal {
    
    static let title = "Details"
    static let boxTopMargin: CGFloat = 15.0
    static let boxBottomMargin: CGFloat = 25.0
    static let boxMargin: CGFloat = 10.0
    static let margin: CGFloat = 23.0
    static let ballTopMargin: CGFloat = 15.0
    static let statusAlignLeading: CGFloat = 10.0
    static let topMargin: CGFloat = 5.0
    static let topTitleMargin: CGFloat = 12.0
    static let labelHeight: CGFloat = 30.0
    static let ballRadius: CGFloat = 13.0
    static let originTitleLabelText = "Last known location: "
    static let locationTitleLabelText = "First seen in: "
    static let boxviewCorner: CGFloat = 20
}
