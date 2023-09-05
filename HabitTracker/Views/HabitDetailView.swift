//
//  HabitDetailView.swift
//  HabitTracker
//
//  Created by Brandon Coston on 9/4/23.
//

import SwiftUI

struct HabitDetailView: View {
    @ObservedObject var habitModel: HabitModel
    var habit: Habit
    
    @State private var amount = 0
    
    var currentCount: Int {
        get {
            return habit.count + amount
        }
    }
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(habit.title)
                        .font(.title)
                    Text(habit.description)
                }
                Spacer()
            }
            .padding(.bottom, 32)
            Text("Completion Count")
            HStack {
                Button {
                    amount -= 1
                } label: {
                    Image(systemName: "minus")
                }
                .disabled(amount <= -habit.count)
                Text(currentCount, format: .number)
                Button {
                    amount += 1
                } label: {
                    Image(systemName: "plus")
                }
            }
            .font(.largeTitle)
        }
        .navigationTitle("Habit Details")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .frame(maxWidth: .infinity)
        .onDisappear {
            updateHabitAmount()
        }
    }
    
    func updateHabitAmount() {
        let updatedHabit = Habit(title: habit.title, description: habit.description, count: currentCount)
        if let index = habitModel.habits.firstIndex(of: habit) {
            habitModel.habits[index] = updatedHabit
        }
        
    }
    
    
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HabitDetailView(habitModel: HabitModel(), habit: Habit.default)
        }
    }
}
