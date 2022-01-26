//
//  Character.swift
//  RickMorty
//
//  Created by Claudio Smith on 15/01/21.
//  Copyright © 2021 smith.c. All rights reserved.
//

struct RmRoot: Codable  {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Results: Codable {
    let results: [Character]
}

struct Character: Codable {

    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
    let location: Location
    let origin: Location
}

struct Location: Codable {
    let name: String
}
