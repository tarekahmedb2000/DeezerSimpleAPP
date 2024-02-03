//
//  Artist.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation


struct Artist: Codable {
    let id: Int
    let name: String
    var image: String
    
    enum CodingKeys:  String,CodingKey {
        case id
        case name
        case image = "picture_big"
    }
}
