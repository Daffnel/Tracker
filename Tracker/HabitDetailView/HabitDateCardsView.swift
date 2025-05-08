//
//  HabitDateCardsView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI
import SwiftData

struct HabitDateCardsView: View {
    
    @Bindable var habit: Habit

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(habit.datesInterVal, id: \.self) { date in
                    let completedDates = habit.completedDates ?? []
                    
                    // Dela upp Annars!!!
                    let isChecked: Binding<Bool> = Binding(
                        get: {
                            completedDates.contains { existingDate in
                                Calendar.current.isDate(existingDate, inSameDayAs: date)
                            }
                        },
                        set: { newValue in
                            var updatedDates = completedDates
                            
                            if newValue {
                                if !updatedDates.contains(where: { Calendar.current.isDate($0, inSameDayAs: date) }) {
                                    updatedDates.append(date)
                                }
                            } else {
                                updatedDates.removeAll {
                                    Calendar.current.isDate($0, inSameDayAs: date)
                                }
                            }
                            
                            habit.completedDates = updatedDates
                            habit.updateIsHabitDone()
                            print(habit.isHabitDone)
                        }
                    )
                    
                    DateCardView(date: date, isChecked: isChecked)
                }
            }
            .padding()
            
        }
    }
    
}
