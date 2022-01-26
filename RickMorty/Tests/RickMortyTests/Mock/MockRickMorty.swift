//
//  File.swift
//  
//
//  Created by Claudio Smith on 25/01/22.
//

import UIKit
import RxSwift

@testable import RickMorty

struct MockRickMorty {
    
    static func mockRickMorty() -> RmRoot? {
        
        guard let rmrootParsed = RmRoot.parseFrom(jsonFile: "ricky-morty") else {
            return nil
        }
        return rmrootParsed
    }
    
}
