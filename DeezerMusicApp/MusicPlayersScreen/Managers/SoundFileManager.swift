//
//  SoundFileManager.swift
//  DeezerMusicApp
//
//  Created by tarek ahmed on 02/02/2024.
//

import Foundation


class SoundFileManager {
    
    static var shared = SoundFileManager()
    
    private init() { }
    
    func saveFile(with fileName : String ,and soundData: Data) {
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            // Create the file URL
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            do {
                // Write content to the file
                try soundData.write(to: fileURL)
                print("File created successfully at: \(fileURL.path)")
            } catch {
                print("Error creating the file: \(error.localizedDescription)")
            }
        }
    }
    
    func getFileData(with fileName:String)  -> Data? {
        
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            // Create the file URL
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            
            guard FileManager.default.fileExists(atPath: fileURL.path) else {
                return nil
            }
            
            do {
                // Read content from the file
                let data =  try Data(contentsOf: fileURL)
                print("file Contents : \(data)")
                return data
            } catch {
                print("Error reading the file: \(error.localizedDescription)")
                return nil
            }
        }
        return nil
    }
    
    
}
