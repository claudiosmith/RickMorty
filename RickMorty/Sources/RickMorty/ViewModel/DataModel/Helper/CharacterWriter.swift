//
//  CharacterWriter.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

protocol CharacterPlistHandlerProtocol {

    func read(using characters: [CharacterViewData]) -> (charlist: [CharacterViewData], favlist: [CharacterViewData])?
    func write(_ favourites: [CharacterViewData])
}

struct CharacterPlistHandler: CharacterPlistHandlerProtocol {
    
    func read(using characters: [CharacterViewData]) -> (charlist: [CharacterViewData], favlist: [CharacterViewData])? {
        
        guard let url = FileManager.getUrl(for: Plist.favouriteFilename,
                                           using: Plist.extension) else {
            print(Plist.errorMessage)
            return nil
        }
        do {
            let plistDecoder = PropertyListDecoder()
            let data = try Data.init(contentsOf: url)
            let favPlist = try plistDecoder.decode([FavouriteViewData].self, from: data)
            let newlists = convertFromPlist(favplist: favPlist, characterList: characters)
            return newlists
        } catch {
            print(error)
        }
        return nil
    }
    
    private func convertFromPlist(favplist: [FavouriteViewData],
                                  characterList: [CharacterViewData]) -> ([CharacterViewData], [CharacterViewData]) {
        
        var characters = characterList,
            favorites: [CharacterViewData] = [CharacterViewData]()
        
        favplist.forEach() { element in
            guard let index = characterList.firstIndex( where: { $0.id == element.id }) else { return }
            
            characters[index].favourite = true
            characters[index].favButtonTitle = CharacterVal.buttonTitleFav
            favorites.append(characters[index])
            
        }
        return (characters, favorites)
    }
    
    func write(_ favourites: [CharacterViewData]) {
        
        let favouritePlist = convertToPlist(favourites: favourites)
        guard let url = FileManager.getUrl(for: Plist.favouriteFilename,
                                           using: Plist.extension) else {
            print(Plist.errorMessage)
            return
        }
        do {
            let plistEncoder = PropertyListEncoder()
            plistEncoder.outputFormat = .xml
            let plistData = try plistEncoder.encode(favouritePlist)
            try plistData.write(to: url)
            
        } catch {
            print(error)
        }
    }
    
    private func convertToPlist(favourites: [CharacterViewData]) -> [FavouriteViewData] {
        var favouritePlist: [FavouriteViewData] = [FavouriteViewData]()
        
        favourites.forEach() { element in
            let viewdata = FavouriteViewData(id: element.id, name: element.name)
            favouritePlist.append(viewdata)
        }
        return favouritePlist
    }

}
