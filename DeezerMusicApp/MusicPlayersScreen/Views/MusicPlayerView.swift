//
//  MusicPlayerView.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import SwiftUI

struct MusicPlayerView: View {
    
    @StateObject var musicPlayerViewModel: MusicPlayerViewModel
    @StateObject var imageViewModel =  ImageViewModel()
    var track : Track
    
    @State var albumUiimage : UIImage?
    @State var artistUiimage : UIImage?
    
    init(track:Track) {
        self.track = track
        _musicPlayerViewModel = StateObject(wrappedValue: MusicPlayerViewModel(track: track))
    }
    
    var body: some View {
        
        GeometryReader { reader in
            ZStack {
                
                if let uiImage = albumUiimage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .ignoresSafeArea()
                }
                
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack(alignment: .center,spacing: 30) {
                    
                    if let uiImage = artistUiimage {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 200,height: 200)
                            .clipShape(
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                            )
                    }
                    
                    
                    
                    
                        
                        Text("\(SoundPlayerManager.shared.status.text)")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Button(action: {
                            musicPlayerViewModel.playSound()
                        }, label: {
                            Image(SoundPlayerManager.shared.status == .playing ? "pauseButton"
                                   : "playButton")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                        })
                        .clipShape(
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                        )
                        .frame(width: 50,height: 50)
                    
                }
                
            }
        }
        .onAppear {
            Task {
                albumUiimage = await imageViewModel.loadImage(url: self.track.album.image)
                
                artistUiimage = await imageViewModel.loadImage(url: self.track.artist.image)
            }
        }
        .onDisappear {
            musicPlayerViewModel.reset()
        }
    }
}

#Preview {
    MusicPlayerView(track: Track(id: 11, title: "11", duration: 11, preview: "https://cdns-preview-d.dzcdn.net/stream/c-deda7fa9316d9e9e880d2c6207e92260-10.mp3", artist: Artist(id: 11, name: "dad", image: "https://e-cdns-images.dzcdn.net/images/artist/cc3b1efce691fc86644748dba8affa21/56x56-000000-80-0-0.jpg"), album: Album(id: 11, title: "dasd", type: "dasd", image: "https://e-cdns-images.dzcdn.net/images/cover/2e018122cb56986277102d2041a592c8/1000x1000-000000-80-0-0.jpg")))
}
