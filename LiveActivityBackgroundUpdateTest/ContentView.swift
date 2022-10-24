//
//  ContentView.swift
//  LiveActivityBackgroundUpdateTest
//
//  Created by Jinyu Meng on 2022/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Refresh Live Activity with sound background mode.")
                .font(.title3)
            Text("1. Prepare a background task. (Or your app will be closed when the sound stopped.)")
            Text("2. Stop the sound for 5 seconds before refreshing.")
            Text("3. Refresh your activity.")
        }
        .padding()
        .onAppear {
            _ = SoundPlayer.shared
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
