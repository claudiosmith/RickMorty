//
//  File.swift
//  
//
//  Created by Claudio Smith on 14/01/22.
//

import Foundation

extension Data {
    
    func toDictionary() -> [String: Any]? {
        var dictionaryValue: [String: Any]?
        do {
            let dictFromData = try PropertyListSerialization
                                   .propertyList(from: self,
                                                 options: PropertyListSerialization.ReadOptions.mutableContainers,
                                                 format: nil) as? [String: Any]
            if let dict = dictFromData {
               dictionaryValue = dict
            }
        } catch {
            print(error)
        }
       return dictionaryValue
    }

    func toJsonString() -> String? {
        guard let jsonString = String(bytes: self, encoding: .utf8)
            else { return nil }

        return jsonString
    }
}
