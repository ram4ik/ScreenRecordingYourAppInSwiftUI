//
//  Home.swift
//  ScreenRecordingYourAppInSwiftUI
//
//  Created by ramil on 01.02.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                Text("Hello, World!")
                
                Spacer()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
