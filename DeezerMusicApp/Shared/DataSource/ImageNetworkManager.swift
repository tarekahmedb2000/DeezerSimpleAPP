//
//  ImageNetworkManager.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation

class ImageNetworkManager {

    
    func loadImage(with url : String) async  -> Data? {
        
        guard let url = APIUrls.getImage(url: url).url else {
             return nil
        }
        
        do {
            let (data,response) = try await URLSession.shared.data(for: URLRequest(url: url))
            return data
        } catch {
            print(error)
            return nil
        }
    }

}
