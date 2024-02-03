//
//  ImageViewModel.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation
import SwiftUI

@MainActor
class ImageViewModel : ObservableObject {
    @Published var image : UIImage?
    
    private var imageService = ImageService()
    
    func loadImage(url:String) async -> UIImage? {
        if let data = await imageService.loadImage(with: url) {
            return UIImage(data: data)
        }
        
        return nil
    }
    
}
