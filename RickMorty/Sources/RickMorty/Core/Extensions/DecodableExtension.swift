//
//  DecodableExtension.swift
//  
//
//  Created by Claudio Smith on 25/01/22.
//

import Foundation

extension Decodable {
    
    internal static func parseFrom(jsonFile: String) -> Self? {

        guard let url = Bundle.module.url(forResource: jsonFile, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let output = try? JSONDecoder().decode(self, from: data)
        else {
            return nil
        }
        return output
    }
}
