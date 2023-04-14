//
//  CustomNetworkError.swift
//  RickMorty
//
//  Created by Claudio Smith on 15/01/2021.
//  Copyright © 2020 smith.c. All rights reserved.

import UIKit

protocol CustomNetworkErrorProtocol: Error {

    var title: String? { get }
    var code: Int? { get }
    var error: Error? { get }
    var message: String? { get }
}

struct CustomNetworkError: CustomNetworkErrorProtocol {

    public var error: Error?
    public var title: String?
    public var code: Int?
    public let message: String?
    public var failureDescription: String? { return _description }
    
    private var _description: String

    public var localizedDescription: String {
        if let message = self.message {
            return message
        } else if let desc = error?.localizedDescription {
            return desc
        }
        return "undefined error"
    }

    public init(_ message: String, _ code: Int) {
        self.message = message
        self.code = code
        title = title ?? "Error"
        _description = message
    }

    public init(_ error: ServiceError, _ title: String? = nil) {
        self.title = title ?? "Error"
        _description = error.errorMessage
        self.error = error
        message = ""
    }

    public init(description: String, code: Int, title: String? = nil) {
        self.title = title ?? "Error"
        _description = description
        self.code = code
        message = description
    }
}

enum ServiceError: Error {

    case apiError
    case invalidEndpoint
    case invalidResponse
    case invalidData
    case decodeError
    case noInternet
    case timeout
    case unknown

    public var errorMessage: String {
        switch self {
        case .apiError:
            return "Api not found or unknown remote error"
        case .invalidEndpoint:
            return "Endpoint not found"
        case .invalidResponse:
            return "Response returned empty"
        case .invalidData:
            return "Response contains empty or invalid data"
        case .decodeError:
            return "Error on decode data"
        case .noInternet:
            return "No internet connection"
        case .timeout:
            return "Connection timeout"
        case .unknown:
            return "An unknown error occurred"
        }
    }
}

struct ErrorKnown {
   static let noConnection = 13
}

public enum HTTPError: Int {
    case unidentified
    case notFound = 404
    case unauthorized = 401
}
