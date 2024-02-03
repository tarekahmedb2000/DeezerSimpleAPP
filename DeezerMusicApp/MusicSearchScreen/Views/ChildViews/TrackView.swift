//
//  TrackView.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import SwiftUI

struct TrackView: View {
    
    @StateObject var viewModel = ImageViewModel()
    @State var albumUIimage: UIImage?
    
    var track : Track
    init(track : Track) {
        self.track = track
    }
    
    var body: some View {
        
        HStack(spacing: 20) {
            if let uiImage = albumUIimage {
                Image(uiImage: uiImage)
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(
                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    )
                
            }
            
            VStack(alignment: .leading) {
                Text("name: \(track.title)")
                Text("artist:\(track.artist.name)")
                Text("duration:\(track.duration)")
            }
            .font(.title2)
            
        }.onAppear {
            Task {
                self.albumUIimage = await viewModel.loadImage(url:track.album.image)
            }
        }
    }
}

#Preview {
    TrackView(track: Track(id: 11, title: "11", duration: 11, preview: "https://cdns-preview-d.dzcdn.net/stream/c-deda7fa9316d9e9e880d2c6207e92260-10.mp3", artist: Artist(id: 11, name: "dad", image: "https://e-cdns-images.dzcdn.net/images/artist/cc3b1efce691fc86644748dba8affa21/56x56-000000-80-0-0.jpg"), album: Album(id: 11, title: "dasd", type: "dasd", image: "https://e-cdns-images.dzcdn.net/images/cover/2e018122cb56986277102d2041a592c8/1000x1000-000000-80-0-0.jpg")))
}
