//
//  NetworkHandlingError.swift
//  RickyMorty
//
//  Created by Claudio Smith on 15/01/21.
//  Copyright © 2021 smith.c. All rights reserved.
//

import Foundation
import RxSwift

struct NetworkHandlingError {

    func errorHandler<T>(_ error: Error?, _ observer: AnyObserver<T>)  {

        var gnerror: CustomNetworkError

        switch error?._code {
        case NSURLErrorTimedOut:
            gnerror = CustomNetworkError(.timeout)
            break
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost, NSURLErrorDataNotAllowed:
            gnerror = CustomNetworkError(.noInternet)
            break
        default:
            gnerror = CustomNetworkError(.unknown)
            break
        }
        observer.onError(gnerror)
    }
    
    func errorCompletionHandler(_ error: Error?, _ completion: Completion)  {

        var gnerror: CustomNetworkError

        switch error?._code {
        case NSURLErrorTimedOut:
            gnerror = CustomNetworkError(.timeout)
            break
        case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
            gnerror = CustomNetworkError(.noInternet)
            break
        default:
            gnerror = CustomNetworkError(.unknown)
            break
        }
        completion(.failure(gnerror))
    }

}
