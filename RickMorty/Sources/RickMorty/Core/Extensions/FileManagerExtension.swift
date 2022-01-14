//
//  File.swift
//  
//
//  Created by Claudio Smith on 14/01/22.
//

import Foundation

extension FileManager {

    static func getUrl(for filename: String, using `extension`: String) -> URL? {
        
        let fullname = "\(filename).\(`extension`)"
        
        return try? FileManager.default.url(
                    for: .documentDirectory, in: .userDomainMask,
                    appropriateFor: nil, create: false).appendingPathComponent(fullname)
    }

}
