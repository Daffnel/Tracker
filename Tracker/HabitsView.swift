//
//  HabitsView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-07.
//

import SwiftUI
import SwiftData


struct HabitsView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Habit.startDate, order: .reverse),
        SortDescriptor(\Habit.name),
    ]) var habits: [Habit]

    
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(habits) { habit in
                    NavigationLink(value: habit) {
                        VStack(alignment: .leading) {
                            Text(habit.name)
                                .font(.headline)
                            Text(habit.moreInfo)
                            
                            
                            
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationDestination(for: Habit.self) {habit in
                HabitInfoView(habit: habit)
            }
            .navigationTitle("Lista med all vanor")
        }
    }
    func delete(_ indexSet: IndexSet) {
        for index in indexSet {
            let habit = habits[index]
            modelContext.delete(habit)
        }
    }
}

#Preview {
    HabitsView()
}
