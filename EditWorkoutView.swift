//
//  EditWorkoutView.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/20/24.
//

import SwiftUI
import SwiftData

struct EditWorkoutView: View {
    let workout: Workout
    
    @State private var weight = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.teal.opacity(0.4).ignoresSafeArea()
                VStack{
                    VStack {
                        TextField("Add New Weight", text: $weight)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(maxWidth: 250)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                            .border(Color.black)
                            .padding()
                        Button("Save") {
                            addWeight(weight: weight)
                        }
                        .padding()
                        .font(.title3.bold())
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                        .shadow(radius: 10)
                        .overlay(
                            Capsule()
                                .stroke(.blue.opacity(0.7), lineWidth: 5)
                        )
                    }
                    .padding()
                    Rectangle()
                        .frame(height: 0.4)
                        .background(.gray.opacity(0.8))
                        .padding()
                    VStack {
                        Text("Past Weights:")
                            .font(.title.bold())
                        
                        List{
                            let sortedKeys = workout.weights.keys.sorted(by: >)
                            ForEach(sortedKeys, id: \.self) {key in
                                Text("\(key) lbs: \(workout.weights[key] ?? " ")")
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle(workout.name)
            .navigationBarTitleDisplayMode(.large)
        }
    }
    func addWeight(weight: String) {
        let weights = Int(weight)
        workout.weight = weights!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedDate = dateFormatter.string(from: Date())
        workout.weights[weights!] = formattedDate
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Gym.self, configurations: config)
        let workout = Workout(name: "Bench", type: "Push", weight: 250, weights: [250:"Now"])
        
        return EditWorkoutView(workout: workout)
            .modelContainer(container)
    } catch {
        return Text("Failed to create prieview:  \(error.localizedDescription)")
    }
}
