//
//  File.swift
//  
//
//  Created by Claudio Smith on 14/01/22.
//

import Foundation

extension Dictionary {

    func toJson() -> String? {

        if let data = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted),
           let jsonText = String(data: data, encoding: String.Encoding.utf8) {
           return jsonText
        }
        return nil
    }

}
