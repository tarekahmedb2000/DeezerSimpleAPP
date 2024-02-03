//
//  Chart.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

struct Chart: Codable {
    var trackResponse: TrackResponse
    var artistResponse: ArtistResponse
    
    enum CodingKeys: String, CodingKey {
        case trackResponse = "tracks"
        case artistResponse = "artists"
    }
}

struct TrackResponse : Codable {
    var tracks : [Track]
    
    enum CodingKeys: String, CodingKey {
        case tracks = "data"
    }
    
}

struct ArtistResponse : Codable {
    var artists : [Artist]
    
    enum CodingKeys: String, CodingKey {
        case artists = "data"
    }
}
