//
//  ImageService.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation


class ImageService {
    
  private let imageNetworkManager = ImageNetworkManager()
    
    func loadImage(with url : String) async -> Data? {
        return await imageNetworkManager.loadImage(with: url)
    }
    
}
