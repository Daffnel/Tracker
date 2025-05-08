//
//  HabitsStatsCard.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI

struct HabitStatsCard: View {
    var habits: [Habit]

    var body: some View {
        
        let total = habits.count
        let done = habits.filter { habit in
            let completed = habit.completedDates ?? []
            return !completed.isEmpty && completed.count == habit.datesInterVal.count
        }.count

        VStack(alignment: .leading, spacing: 8) {
            Text("Statistik")
                .font(.title2.bold())

            HStack {
                VStack(alignment: .leading) {
                    Text("Antal utmaningar")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(total)")
                        .font(.headline)
                }

                Spacer()

                VStack(alignment: .leading) {
                    Text("Totalt antal avklarade")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("\(done)")
                        .font(.headline)
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
