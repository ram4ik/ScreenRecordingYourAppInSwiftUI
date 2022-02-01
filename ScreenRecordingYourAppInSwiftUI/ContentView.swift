//
//  ContentView.swift
//  ScreenRecordingYourAppInSwiftUI
//
//  Created by ramil on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isRecording: Bool = false
    @State var url: URL?
    @State var shareVideo: Bool = false

    var body: some View {
        Home()
            .overlay(alignment: .bottomTrailing){
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            if isRecording {
                                Task {
                                    do {
                                        self.url = try await stopRecording()
                                        isRecording = false
                                        shareVideo.toggle()
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                }
                            } else {
                                startRecording { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                        return
                                    }
                                    isRecording = true
                                }
                            }
                        }, label: {
                            Image(systemName: isRecording ? "record.circle.fill" : "record.circle")
                                .font(.largeTitle)
                                .foregroundColor(isRecording ? .red : .white)
                                .background(isRecording ? .white : .red)
                                .cornerRadius(.infinity)
                        })
                        .padding()
                    }
                }
            }
            .shareSheet(show: $shareVideo, items: [url])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
