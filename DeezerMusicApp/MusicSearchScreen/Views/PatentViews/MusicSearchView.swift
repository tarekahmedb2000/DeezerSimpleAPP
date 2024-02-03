//
//  ContentView.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import SwiftUI

struct MusicSearchView: View {
    
    @StateObject var viewModel = MusicSearchViewModel()
    
    var body: some View {
        NavigationStack {
            
            if !(viewModel.searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                if let searchedTracks = viewModel.searchedTracks {
                    
                    Section {
                        List(searchedTracks) { track in
                            
                            NavigationLink(destination: MusicPlayerView(track: track)) {
                                TrackView(track: track)
                            }
                        }
                    } header: {
                        Text("Searched Track")
                            .bold()
                            .font(.title2)
                    }
                }
            } else if let topTracks = viewModel.topTracks {
                
                Section {
                    List(topTracks) { track in
                        
                        NavigationLink(destination: MusicPlayerView(track: track)) {
                            TrackView(track: track)
                        }
                    }
                } header: {
                    Text("Top Charts")
                        .bold()
                        .font(.title2)
                }
            } else {
                Text("No Matches Found")
                    .font(.title)
            }
        }
        .searchable(text: $viewModel.searchText)
        
        
    }
    
}

#Preview {
    MusicSearchView()
}
