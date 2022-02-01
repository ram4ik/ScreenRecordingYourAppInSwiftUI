//
//  Extensions.swift
//  ScreenRecordingYourAppInSwiftUI
//
//  Created by ramil on 01.02.2022.
//

import SwiftUI
import ReplayKit

extension View {
    
    func startRecording(enableMicrophone: Bool = false, completion: @escaping (Error?) -> ()) {
        
        let recorder = RPScreenRecorder.shared()
        
        recorder.isMicrophoneEnabled = false
        
        recorder.startRecording(handler: completion)
    }
    
    func stopRecording() async throws -> URL {
        
        let name = UUID().uuidString + ".mov"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
        let recorder = RPScreenRecorder.shared()
        try await recorder.stopRecording(withOutput: url)
        
        return url
    }
    
    func cancelRecording() {
        
        let recorder = RPScreenRecorder.shared()
        recorder.discardRecording {
             
        }
    }
    
    func shareSheet(show: Binding<Bool>, items: [Any?]) -> some View {
         return self
            .sheet(isPresented: show) {
                
            } content: {
                let items = items.compactMap { item -> Any? in
                    return item
                }
                
                if !items.isEmpty {
                    ShareSheet(items: items)
                }
            }

    }
}
