//
//  MusicSearchViewModel.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class MusicSearchViewModel: ObservableObject {
    
    @Published var topTracks: [Track]?
    @Published var searchedTracks: [Track]?
    @Published var searchText: String = ""
    private var service = TrackService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        loadTopTracks()
        observeSearhText()
    }
    
    func loadTopTracks() {
        Task {
            self.topTracks = await self.service.loadTopTrack()
        }
    }
    
    func observeSearhText() {
        $searchText
            .debounce(for: .seconds(1), scheduler: RunLoop.main)
            .sink { [weak self] newText in
                self?.loadTrack(with: newText)
            }
            .store(in: &cancellables)
    }
    
    func loadTrack(with name : String) {
        Task { [weak self]  in
            self?.searchedTracks = await self?.service.loadTracks(with: name)
        }
    }
    
}
