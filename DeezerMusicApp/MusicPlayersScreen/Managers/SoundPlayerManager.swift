//
//  SoundPlayerManager.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//


import AVFoundation
import Combine

class SoundPlayerManager: NSObject, ObservableObject {
    
    enum SoundPlayingStatus {
        case idle
        case playing
        case paused
        case finished
        
        
        var text : String {
            switch self {
            case .idle:
                return "idle"
            case .playing:
                return "playing"
            case .paused:
               return "paused"
            case .finished:
                return "finished"
            }
        }
        
    }
    
    static let shared = SoundPlayerManager()
    @Published var status: SoundPlayingStatus = .idle
    
    private var audioPlayer: AVAudioPlayer?

    private override init() {
        super.init()
    }
    
    func reset() {
        status = .idle
        audioPlayer = nil
    }
    
    func handleStatus(with data: Data? = nil) {
        switch status {
        case .idle:
            playSound(with: data)
        case .playing:
            pauseSound()
        case .paused:
            resumeSound()
        case .finished:
            playSound(with: data)
        }
    }

    private func playSound(with data : Data?) {
        
        guard let data = data else {
            status = .idle
            return
        }
        
        do {
            status = .playing
            audioPlayer = try AVAudioPlayer(data: data)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }

    private func stopSound() {
        if let player = audioPlayer, player.isPlaying {
            player.stop()
            status = .finished
        }
    }

    private func pauseSound() {
        if let player = audioPlayer, player.isPlaying {
            player.pause()
            status = .paused
        }
    }

    private func resumeSound() {
        if let player = audioPlayer, !player.isPlaying {
            player.play()
            status = .playing
        }
    }

    private func isPlaying() -> Bool {
        return audioPlayer?.isPlaying ?? false
    }
}

extension SoundPlayerManager : AVAudioPlayerDelegate  {
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        reset()
    }
}



