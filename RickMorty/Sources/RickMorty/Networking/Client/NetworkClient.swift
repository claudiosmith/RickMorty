//
//  NetworkClient.swift
//  RickMorty
//
//  Created by Claudio Smith on 12/01/2021.
//  Copyright © 2020 smith.c. All rights reserved.
//

import UIKit
import RxSwift

enum Result<T, U: CustomNetworkErrorProtocol> {
    case success(T)
    case failure(U)
}

typealias Completion = (Result<UIImage, CustomNetworkError>) -> Void

protocol NetworkClientProtocol {

    func request(_ url: URL) -> Observable<Data>
    func loadImage(_ url: URL, _ completion: @escaping (Completion)) 
}

final class NetworkClient: NetworkClientProtocol {
    
    func loadImage(_ url: URL, _ completion: @escaping (Completion)) {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                NetworkHandlingError().errorCompletionHandler(error, completion)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                NetworkHandlingError().errorCompletionHandler(CustomNetworkError(.invalidData), completion)
                return
            }
            
            guard let response = response as? HTTPURLResponse,
               Constants.minStatusSuccess...Constants.maxStatusSuccess ~= response.statusCode else {
               NetworkHandlingError().errorCompletionHandler(CustomNetworkError(.apiError), completion)
               return
            }
            completion(.success(image))
        }
        task.resume()
    }
    
    func request(_ url: URL) -> Observable<Data> {
          
        return Observable.create { observer -> Disposable in
            URLSession.shared.dataTask(with: url) { data, response, error -> Void in
                
                guard error == nil else {
                    NetworkHandlingError().errorHandler(error, observer)
                    return
                }
                
                guard let data = data else {
                    NetworkHandlingError().errorHandler(CustomNetworkError(.invalidData), observer)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                   Constants.minStatusSuccess...Constants.maxStatusSuccess ~= response.statusCode else {
                   NetworkHandlingError().errorHandler(CustomNetworkError(.apiError), observer)
                   return
                }
                observer.onNext(data)
            }.resume()
            return Disposables.create()
        }
    }
}
