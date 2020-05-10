//
//  MarvelApiResponse.swift
//  MarvelArena
//
//  Created by Daniel Carenas Roncero on 09/05/2020.
//  Copyright © 2020 Daniel Carenas Roncero. All rights reserved.
//

import Foundation

// MARK: MarvelAPIResponse
struct MarvelAPIResponse: Codable {
    let code: Int
    let status, copyright, attributionText: String
    let etag: String
    let data: DataClass
}

// MARK: DataClass
struct DataClass: Codable {
    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: Result
struct Result: Codable {
    let id: Int
    let name, resultDescription: String
    let thumbnail: Thumbnail
    let comics: Comics
    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail, comics
    }
}

// MARK: Thumbnail
struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: Comics
struct Comics: Codable {
   let available: Int
}
