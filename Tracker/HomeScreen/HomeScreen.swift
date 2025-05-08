//
//  HomeScreen.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-07.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
    
    @Query(sort: [SortDescriptor(\Habit.startDate)]) var habits: [Habit]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                   
                    HabitStatsCard(habits: habits)

                
                    Text("Kommande utmaningar")
                        .font(.title2.bold())
                        .padding(.horizontal)

                    ForEach(upcomingHabits(), id: \.self) { habit in
                        NavigationLink(destination: HabitInfoView(habit: habit)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(habit.name)
                                        .font(.headline)
                                    Text("Startar \(habit.startDate.formatted(date: .abbreviated, time: .omitted))")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Bli en bättre människa")
        }
    }

    func upcomingHabits() -> [Habit] {
        let today = Calendar.current.startOfDay(for: Date())
        return habits.filter { $0.startDate >= today }
                     .sorted { $0.startDate < $1.startDate }
    }
}
