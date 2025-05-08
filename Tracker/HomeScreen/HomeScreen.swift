//
//  HomeScreen.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-07.
//

import SwiftData
import SwiftUI

struct HomeScreen: View {

    //MARK: - Query
    @Query(sort: [SortDescriptor(\Habit.startDate)]) var habits: [Habit]

    //MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    HabitStatsCard(habits: habits)

                    //MARK: - Kommande aktiviteter
                    Text("Kommande Aktiviteter")
                        .font(.title2.bold())
                        .padding(.horizontal)
                        .foregroundColor(.primary)

                    ForEach(upcomingHabits(), id: \.self) { habit in
                        let remaining = habit.progress(habit: habit)

                        NavigationLink(destination: HabitInfoView(habit: habit))
                        {
                            HStack {
                                VStack(alignment: .leading, spacing: 8) {
                                    Text(habit.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)

                                    Text(
                                        "Startar: \(habit.startDate.formatted(date: .abbreviated, time: .omitted))"
                                    )
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)

                                    Text(
                                        "Avklarat: \(String(format: "%.0f", remaining * 100))%"
                                    )
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)

                                    ProgressView(value: remaining)
                                        .accentColor(.orange)
                                        .padding(.top, 4)
                                }
                                Spacer()
                                Label(
                                    "",
                                    systemImage: habit.isHabitDone
                                        ? "checkmark.seal.fill" : "xmark.seal"
                                )
                                .foregroundColor(
                                    habit.isHabitDone ? .green : .red
                                )
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                            .shadow(radius: 5)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Bli en bättre människa")
        }
    }

    //MARK: - Helper Methods

    func upcomingHabits() -> [Habit] {
        let today = Calendar.current.startOfDay(for: Date())
        return habits.filter { $0.startDate >= today }
            .sorted { $0.startDate < $1.startDate }
    }
}
