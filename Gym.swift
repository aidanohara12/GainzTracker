//
//  Gym.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/18/24.
//

import SwiftData
import Foundation

@Model
class Gym {
    var name: String
    var location: String
    var type: String
    @Relationship(deleteRule: .cascade) var workout = [Workout]()
    
    
    init(name: String, location: String, type: String) {
        self.name = name
        self.location = location
        self.type = type
    }
}
