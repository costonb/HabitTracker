//
//  HabitList.swift
//  HabitTracker
//
//  Created by Brandon Coston on 9/4/23.
//

import SwiftUI

struct HabitList: View {
    @StateObject var habitModel = HabitModel()
    
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habitModel.habits) { habit in
                    NavigationLink {
                        HabitDetailView(habitModel: habitModel, habit: habit)
                    } label: {
                        HabitRowView(habit: habit)
                    }

                }
            }
            .navigationTitle("Habit Tracker")
            .toolbar {
                Button {
                    showingAddHabit.toggle()
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(habitModel: habitModel)
        }
    }
}

struct HabitList_Previews: PreviewProvider {
    static var previews: some View {
        HabitList()
    }
}
