//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Brandon Coston on 3/18/23.
//

import SwiftUI

struct HabitRowView: View {
    let habit: Habit
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(habit.title)
                    .font(.headline)
                    .lineLimit(1)
                    .truncationMode(.tail)
                Text(habit.description)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            Spacer()
            Text(habit.count, format: .number)
                .font(.largeTitle)
        }
    }
}

struct HabitRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HabitRowView(habit: Habit.default)
            HabitRowView(habit: Habit.default)
            HabitRowView(habit: Habit.default)
        }
    }
}
