//
//  MusicPlayerService.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

class MusicPlayerService: ObservableObject {
    @Published var soundData: Data?
    private let musicPlayerNetworkManager = MusicPlayerNetworkManager()
    
    func loadSoundData(with url:String ,and fileName:String) async -> Data? {
        if let soundData = SoundFileManager.shared.getFileData(with: fileName) {
            return soundData
        }else {
            guard let data = await musicPlayerNetworkManager.loadSoundData(with: url) else {
                return nil
            }
            SoundFileManager.shared.saveFile(with: fileName, and: data)
            return data
        }
    }
    
    
    
    
    
    
    
    
    
}
