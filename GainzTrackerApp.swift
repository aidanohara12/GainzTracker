//
//  GainzTrackerApp.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/18/24.
//
import SwiftData
import SwiftUI

@main
struct GainzTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Gym.self)
    }
}

//var container: ModelContainer
//
//init() {
//    do {
//        let config1 = ModelConfiguration(for: Gym.self)
//        let config2 = ModelConfiguration(for: Workout.self, isStoredInMemoryOnly: true)
//        container = try ModelContainer(for: Gym.self, Workout.self, configurations: config1, config2)
//    } catch {
//        fatalError("Failed to configure SwiftData container.")
//    }
//}
