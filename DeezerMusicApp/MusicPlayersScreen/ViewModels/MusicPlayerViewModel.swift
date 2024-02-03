//
//  MusicPlayerViewModel.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation
import SwiftUI

class MusicPlayerViewModel: ObservableObject {
    var track : Track
    @ObservedObject var soundManager = SoundPlayerManager.shared
    @Published var imageName: String?
    
    private var musicPlayerService = MusicPlayerService()
    
    init(track: Track) {
        self.track = track
        
        soundManager.$status
            .map { status in
                
                print("status ---> \(status)")
                
                
                return SoundPlayerManager.shared.status == .playing ? "pauseButton"
              : "playButton"
                
                
            }
            .receive(on: DispatchQueue.main)
            .assign(to: &$imageName)
    }
    
    func playSound() {
        print(imageName)
        Task {
            if let data = await musicPlayerService.loadSoundData(with: track.preview, and: track.title) {
                SoundPlayerManager.shared.handleStatus(with: data)
            }
        }
    }
    
    func reset() {
        SoundPlayerManager.shared.reset()
    }
    
    
    
    
    
}
