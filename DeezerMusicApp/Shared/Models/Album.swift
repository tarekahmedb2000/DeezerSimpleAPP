//
//  Album.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

struct Album: Codable {
    let id: Int
    let title: String
    let type: String
    var image: String
    
    enum CodingKeys:  String,CodingKey {
        case id
        case title
        case type
        case image = "cover_xl"
    }
}
