//
//  LiveActivityBackgroundUpdateTestApp.swift
//  LiveActivityBackgroundUpdateTest
//
//  Created by Jinyu Meng on 2022/10/24.
//

import SwiftUI

@main
struct LiveActivityBackgroundUpdateTestApp: App {
    @Environment(\.scenePhase) var scenePhase
    @State var backgroundTask: UIBackgroundTaskIdentifier?
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                
            } else if newPhase == .inactive {
                
            } else if newPhase == .background {
                if backgroundTask != nil {
                    UIApplication.shared.endBackgroundTask(backgroundTask!)
                    backgroundTask = UIBackgroundTaskIdentifier.invalid
                }

                backgroundTask = UIApplication.shared.beginBackgroundTask(expirationHandler: { () -> Void in
                    UIApplication.shared.endBackgroundTask(self.backgroundTask!)
                    self.backgroundTask = UIBackgroundTaskIdentifier.invalid
                })
            }
        }
    }
}
