//
//  ContentView.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/18/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var gyms: [Gym]
    
    @State private var showingAddGym = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors:[ .white,.teal], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
                List {
                    Section(gyms.isEmpty ? "Press plus in top right corner to add a new gym!" : "Users Gyms") {
                        ForEach(gyms) { gym in
                            NavigationLink(destination: GymView(gym: gym)) {
                                VStack(alignment: .leading) {
                                    Text(gym.name)
                                        .font(.title)
                                    HStack {
                                        Text("Location: \(gym.location), Type: \(gym.type)")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray.opacity(0.5))
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteGyms)
                    }
                }
            }
            .navigationTitle("GainzTracker")
            .foregroundStyle(.black)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingAddGym.toggle()
                    }) {
                        Image(systemName: "plus")
                    }
                    .foregroundStyle(.blue)
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .foregroundStyle(.blue)
                }
            }
            .sheet(isPresented: $showingAddGym) {
                AddGymView()
            }
        }
        .scrollContentBackground(.hidden)
        
    }
    
    func deleteGyms(at offsets: IndexSet) {
        for offset in offsets {
            let gym = gyms[offset]
            modelContext.delete(gym)
        }
    }
}

#Preview {
    ContentView()
}
