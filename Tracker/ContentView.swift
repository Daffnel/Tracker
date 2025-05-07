//
//  ContentView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var habits: [Habit]

        var body: some View {
            List(habits) { habit in
                VStack(alignment: .leading) {
                    Text(habit.name)
                        .font(.headline)
                    Text(habit.moreInfo)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Test")
                }
            }
            .navigationTitle("Alla vanor")
        }
}

#Preview {
    ContentView()
}
