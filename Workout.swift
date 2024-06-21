//
//  Workout.swift
//  GainzTracker
//
//  Created by Aidan O'Hara on 6/20/24.
//

import Foundation
import SwiftData

@Model
class Workout {
    var name: String
    var type: String
    var weight: Int
    var weights: Dictionary<Int, String>
    
    var owner: Gym?
    
    init(name: String, type: String, weight: Int, weights: Dictionary<Int, String>, owner: Gym? = nil) {
        self.name = name
        self.type = type
        self.weight = weight
        self.weights = weights
        self.owner = owner
    }
}
