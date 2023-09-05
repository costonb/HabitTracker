//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Brandon Coston on 9/4/23.
//

import SwiftUI

struct AddHabitView: View {
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habitModel: HabitModel
    
    var body: some View {
        NavigationView {
            Form {
                TextField(text: $title) {
                    Text("Habit Title")
                }
                TextField(text: $description) {
                    Text("Habit Description")
                }
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let habit = Habit(title: title, description: description)
                    habitModel.habits.append(habit)
                    
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habitModel: HabitModel())
    }
}
