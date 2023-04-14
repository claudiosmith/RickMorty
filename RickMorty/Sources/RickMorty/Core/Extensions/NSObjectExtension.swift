//
//  NSObjectExtension.swift
//  RickMorty
//
//  Created by Claudio Smith on 06/12/2020.
//  Copyright © 2020 smith.c. All rights reserved.
//

import Foundation

extension NSObject {

    func getBundle() -> Bundle {
        let bundle = Bundle(for: Self.self)
        return bundle
    }
    
    func getClassId() -> String {
        
        var classId: String = classForCoder.description()
        if let name = classId.components(separatedBy: ".").last {
            classId = name
        }
        return classId
    } 
}
