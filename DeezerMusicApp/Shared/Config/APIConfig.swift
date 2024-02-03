//
//  APIConfig.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation


enum APIUrls {
    private static let baseUrl = "https://api.deezer.com"
    
    case getTopTracks
    case getTrack(name:String)
    case getImage(url:String)
    case getSoundData(url:String)
     
    var urlText : String {
        switch self {
        case .getTopTracks:
            return Self.baseUrl + "/chart"
        case .getTrack(let name):
        
            return Self.baseUrl + "/search" + "?q=track" + ":\"\(name)\""
        case .getImage(let url),
             .getSoundData(let url):
            return url
        }
    }
    
    var url: URL? {
        guard let urlText = urlText.removingPercentEncoding else {
            return nil
        }
        return URL(string: urlText)
    }
    
}



