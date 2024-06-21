//
//  GymView.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/18/24.
//
import SwiftData
import SwiftUI

struct GymView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showingAddWorkout =  false
    @State private var edit = false
    let gym: Gym
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors:[ .white, .teal], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                VStack {
                    PushView(gym: gym, edit: edit)
                    PullView(gym: gym, edit: edit)
                    LegsView(gym: gym, edit: edit)
                }
            }
            .navigationTitle(gym.name)
            .navigationBarTitleDisplayMode(.inline)
            .scrollBounceBehavior(.basedOnSize)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Workout", systemImage: "plus") {
                        showingAddWorkout.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddWorkout) {
                AddWorkoutView(gym: gym)
            }
        }
        .scrollContentBackground(.hidden)
    }
    
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Gym.self, configurations: config)
       
        let example = Gym(name: "Test Gym", location: "Test location", type: "String")
        
        return GymView(gym: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create prieview:  \(error.localizedDescription)")
    }
}
