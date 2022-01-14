//
//  URLBuilder.swift
//  RickMorty
//
//  Created by Claudio Smith on 23/01/2021.
//  Copyright © 2021 smith.c. All rights reserved.
//

import UIKit

struct URLBuilder {
    
    func getUrl(with info: Info?) -> URL? {
        
        var urlText = String.empty
        if let info = info, let next = info.next {
            urlText = next
        } else {
            urlText = Endpoint.character
        }
        
        let url = URL(string: urlText)
        return url
    }
    
    private func getURLComponents() -> URLComponents {
        
        var components = URLComponents()
        components.scheme = Endpoint.scheme
        components.host = Endpoint.host
        components.path = Endpoint.path
        
        return components
    }
    
    func addQueryItem(_ name: String, _ value: String?, _ queryItems: [URLQueryItem]) -> [URLQueryItem] {
        var items = queryItems
        items.append(URLQueryItem(name: name, value: value))
        
        return items
    }
}
