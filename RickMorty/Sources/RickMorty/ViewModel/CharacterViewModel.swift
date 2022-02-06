//
//  CharacterViewModel.swift
//  RickyMorty
//
//  Created by Claudio Smith on 15/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterViewModel {

    let observerPhoto: BehaviorRelay<UIImage?> = BehaviorRelay(value: nil)
    let observerLine: BehaviorRelay<SegmentedChar?> = BehaviorRelay(value: nil)
    let unitError = BehaviorRelay<Error?>(value: nil)
    let error = PublishSubject<Error>()
    let observerCharacter = BehaviorRelay<[CharacterViewData]>(value: [])
    let observerCharacterList = BehaviorRelay<[CharacterViewData]>(value: [])
    
    var service: CharacterServiceProtocol?
    var info: Info?
    var loadingStatus = false
    var isFavoriteTabSelected = false

    lazy var onError: ((CustomNetworkError?) -> Void) = {_ in}
    lazy var characterList = [CharacterViewData]()
    lazy var favouriteList = [CharacterViewData]()
    
    private let disposeBag = DisposeBag()
    var cache: NSCache<NSString, UIImage>?
    
    init(){}

    init(_ service: CharacterServiceProtocol?, cache: NSCache<NSString, UIImage>?) {
        self.service = service
        self.cache = cache
    }

    func fetchCharacters(_ info: Info? = nil) {

        guard let url = URLBuilder().getUrl(with: info) else { return }

        isFavoriteTabSelected = false
        service?.fetchCharacter(url).subscribe( onNext: { [weak self] root in
            guard let self = self else { return }

            let character = root.results
            var builder: CharacterBuilderProtocol = CharacterBuilder()
            let characters = builder.set(using: character, favourites: self.favouriteList)
                                    .build()
            
            self.characterList += characters ?? [CharacterViewData]()
            self.readFavourites()
            self.observableCharacters()
            self.info = root.info
            self.loadingStatus = false
            
            }, onError: { [weak self] error in
                self?.unitError.accept(error)
                self?.onError(error as? CustomNetworkError)
            }
        ).disposed(by: disposeBag)
    }
    
    func tabSelected(with selected: SegmentedChar) {
        observerLine.accept(selected)
        
        guard selected == .favorites else {
            self.observableCharacters()
            return
        }
        self.fetchFavCharacters()
    }
    
    func fetchFavCharacters() {
        isFavoriteTabSelected = true
        self.observerCharacter.accept(self.favouriteList)
    }
    
    func observableCharacters() {
        isFavoriteTabSelected = false
        self.observerCharacter.accept(self.characterList)
        self.observerCharacterList.accept(self.characterList)
    }
    
    func fetchImage(_ data: CharacterViewData?, _ completion: @escaping (Completion)) {
        
        guard let url = URL(string: data?.imageLink ?? String.empty), let data = data else { return }
        
        service?.fetchImage(url, using: cache) { [weak self] result in
            switch result {
            case .success(let image):
                guard let self = self,
                      let index = self.characterList.firstIndex( where: { $0.id == data.id }) else { return }
                
                self.characterList[index].image = image
                self.observerCharacterList.accept(self.characterList)
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func readFavourites() {
        guard let favourites = CharacterPlistHandler().read(using: characterList) else {
              return
        }
        self.characterList = favourites.charlist
        self.favouriteList = favourites.favlist
    }

    func updateFavourite(viewdata: CharacterViewData?) {
        guard isFavoriteTabSelected == false, let viewdata = viewdata,
              let index = updateCharacter(viewdata: viewdata) else { return }
        
        updateFavourite(viewdata: viewdata, index: index)
        observerCharacter.accept(characterList)
    }
    
    private func updateCharacter(viewdata: CharacterViewData) -> Int? {
        let favourite = !viewdata.favourite
        guard let index = characterList.firstIndex( where: { $0.id == viewdata.id }) else { return nil }
        
        characterList[index].favourite = favourite
        let builder = CharacterBuilder()
        characterList[index].favButtonTitle = builder.setFavButtonTitle(favourite)
        
        return index
    }
    
    private func updateFavourite(viewdata: CharacterViewData, index: Int) {
        
        let favourite = !viewdata.favourite
        guard favourite == false else {
            favouriteList.append(characterList[index])
            CharacterPlistHandler().write(favouriteList)
            return
        }
        
        if let ind = favouriteList.firstIndex( where: { $0.id == viewdata.id }) {
            favouriteList.remove(at: ind)
            CharacterPlistHandler().write(favouriteList)
        }
    }
    
    func loadInfinityScroll() {
        
        guard loadingStatus == false && isFavoriteTabSelected == false else { return }
        loadingStatus = true
        self.fetchCharacters(info)
    }
    
}
