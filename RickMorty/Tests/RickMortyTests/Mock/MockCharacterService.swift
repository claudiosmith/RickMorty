//
//  File.swift
//  
//
//  Created by Claudio Smith on 25/01/22.
//

import UIKit
import RxSwift

@testable import RickMorty

struct MockCharacterService: CharacterServiceProtocol {
    
    var fetchCharacterResult: Result<RmRoot, CustomNetworkError>?
    var fetchImageResult: Result<UIImage, CustomNetworkError>?
    
    func fetchCharacter(_ url: URL) -> Observable<RmRoot> {
        
        return Observable.create { observer in
            switch self.fetchCharacterResult {
            case .success(let root):
                observer.onNext(root)
            case .failure(let error):
                observer.onError(error)
            case .none:
                observer.onError(CustomNetworkError(.unknown))
            }
            return Disposables.create()
        }
    }
    
    func fetchImage(_ url: URL, using cache: NSCache<NSString, UIImage>?, _ completion: @escaping (Completion)) {
        
            switch self.fetchImageResult {
            case .success(let image):
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            case .none:
                completion(.failure(CustomNetworkError(.unknown)))
            }
    }
    
}
