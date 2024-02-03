//
//  Track.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

struct Track: Codable , Identifiable {
    let id: Int
    let title: String
    let duration: Int
    let preview: String
    let artist: Artist
    let album: Album
}
