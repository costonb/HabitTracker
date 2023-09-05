//
//  HabitModel.swift
//  HabitTracker
//
//  Created by Brandon Coston on 3/18/23.
//

import Foundation
import SwiftUI

struct Habit: Identifiable, Codable, Equatable {
    var id = UUID()
    let title: String
    let description: String
    var count = 0
    
    static let `default` = Habit(title: "A test habit with an extra really long name", description: "This is how you describe the test habit", count: 1)
}

class HabitModel: ObservableObject {
    @Published var habits: [Habit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Habit].self, from: savedHabits) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
}
