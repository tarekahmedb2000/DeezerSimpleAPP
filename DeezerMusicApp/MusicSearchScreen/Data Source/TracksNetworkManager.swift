//
//  TracksNetworkManager.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation


class TracksNetworkManager {
    
    @MainActor
    func loadTopTrack() async  -> [Track]? {
        
        guard let url = APIUrls.getTopTracks.url else {
             return nil
        }
        
        do {
            let (data,response) = try await URLSession.shared.data(for: URLRequest(url: url))
            let topTracks = try JSONDecoder().decode(Chart.self, from: data)
            return topTracks.trackResponse.tracks
        } catch {
            print(error)
            return nil
        }
    }
    
    @MainActor
    func loadTracks(with name : String) async  -> [Track]? {
        
        guard let url = APIUrls.getTrack(name: name).url else {
             return nil
        }
        
        do {
            let (data,response) = try await URLSession.shared.data(for: URLRequest(url: url))
            let trackResponse = try JSONDecoder().decode(TrackResponse.self, from: data)
            return trackResponse.tracks
        } catch {
            print(error)
            return nil
        }
    }
    
    
}
 
