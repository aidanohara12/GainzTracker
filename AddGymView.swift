//
//  AddGymView.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/18/24.
//

import SwiftData
import SwiftUI

struct AddGymView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var location = ""
    @State private var type = "Personal"
    
    
    let types = ["Personal", "School", "Work"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.teal.opacity(0.4).ignoresSafeArea()
                Form {
                    Section {
                        TextField("Name:", text: $name)
                        TextField("Location:", text: $location)
                    }
                    Section {
                        Picker("What type of gym is this", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    Section {
                        Button("Save Gym") {
                            let gym = Gym(name: name, location: location, type: type)
                            modelContext.insert(gym)
                            dismiss()
                        }
                        .disabled(name.isEmpty || location.isEmpty)
                    }
                }
            }
            .navigationTitle("Enter Gym Details")
            .scrollBounceBehavior(.basedOnSize)
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    AddGymView()
}
