//
//  CharacterService.swift
//  RickyMorty
//
//  Created by Claudio Smith on 15/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit
import RxSwift

protocol CharacterServiceProtocol {
    
    func fetchCharacter(_ url: URL) -> Observable<Root>
    func fetchImage(_ url: URL, using cache: NSCache<NSString, UIImage>?, _ completion: @escaping (Completion))
}

struct CharacterService: CharacterServiceProtocol {

    private let network: NetworkClientProtocol = NetworkClient()
    private let disposeBag = DisposeBag()

    func fetchCharacter(_ url: URL) -> Observable<Root> {

        return Observable.create { observer -> Disposable in
            network.request(url).subscribe( onNext: { data in
                do {
                    let root = try JSONDecoder().decode(Root.self, from: data)
                    observer.onNext(root)
                } catch {
                    print(error)
                    observer.onError(error)
                }
            }, onError: { error in
                observer.onError(error)
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    func fetchImage(_ url: URL, using cache: NSCache<NSString, UIImage>?, _ completion: @escaping (Completion)) {
    
        if let image = cache?.object(forKey: NSString(string: url.absoluteString)) {
            completion(.success(image))
            return
        }
        
        NetworkClient().loadImage(url) { result in
            switch result {
            case .success(let image):
                cache?.setObject(image, forKey: NSString(string: url.absoluteString))
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
