//
//  TrackService.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

@MainActor
class TrackService: ObservableObject {
        
    private let tracksNetworkManager = TracksNetworkManager()
    
    func loadTopTrack() async -> [Track]? {
        return await tracksNetworkManager.loadTopTrack()
    }
    
    func loadTracks(with name : String) async -> [Track]? {
       return await tracksNetworkManager.loadTracks(with: name)
    }
    
}
