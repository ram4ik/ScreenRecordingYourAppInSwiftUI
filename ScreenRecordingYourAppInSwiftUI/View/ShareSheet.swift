//
//  ShareSheet.swift
//  ScreenRecordingYourAppInSwiftUI
//
//  Created by ramil on 01.02.2022.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        
        let view = UIActivityViewController(activityItems: items  , applicationActivities: nil)
        return view
    }
    
    func updateUIViewController(_ uiView: UIActivityViewController, context: Context) {
        
    }
}
