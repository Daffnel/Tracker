//
//  HabitDetailsCard.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI

struct HabitDetailsCard: View {
    
    @Bindable var habit: Habit
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
               
                Text(habit.name)
                    .font(.largeTitle)
                    .bold()
              
                Text(habit.moreInfo)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Divider()
              
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Label("Start datum", systemImage: "calendar.badge.plus")
                        Spacer()
                        Text(habit.startDate.formatted(date: .long, time: .omitted))
                    }

                    HStack {
                        Label("Slut datum", systemImage: "calendar.badge.minus")
                        Spacer()
                        Text(habit.endDate.formatted(date: .long, time: .omitted))
                    }

                    
                    HStack {
                        Label("Kategori", systemImage: "tag")
                        Spacer()
                        Text(habit.category.categoryName)
                    }

                    HStack {
                        Label("Dagar i rad", systemImage: "flame.fill")
                            .foregroundColor(.orange)
                        Spacer()
                        Text("\(habit.streak) dagar")
                    }

                    if let completedDates = habit.completedDates {
                        let completedRatio = Double(completedDates.count) / Double(habit.datesInterVal.count)
                        let procent = Int(completedRatio * 100)
                    
                        HStack {
                            Label("Avklarat", systemImage: "checkmark.circle.fill")
                                .foregroundColor(.green)
                            Spacer()
                            Text("\(procent) %")
                            
                            Button("hepp"){
                                print(completedDates.count)
                                print(habit.datesInterVal.count)
                            }
                            }
                    }
                    HStack {
                        Label("Status", systemImage: habit.isHabitDone ? "checkmark.seal.fill" : "xmark.seal")
                            .foregroundColor(habit.isHabitDone ? .green : .red)
                        Spacer()
                        Text(habit.isHabitDone ? "färdig" : "Inte färdig")
                    }
                }
                .padding()
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 4)
            }
            .padding()
        }
        
    }
    
}

#Preview {
   // HabitDetailsCard()
}
