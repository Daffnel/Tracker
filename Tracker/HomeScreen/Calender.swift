//
//  CalenderView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-07.
//

import SwiftData
import SwiftUI
import UIKit

struct CalenderView: View {

    @Environment(\.modelContext) private var modelContext
    @Query var habits: [Habit]

    var datesToMark: Set<DateComponents> {
        let calendar = Calendar.current

        return Set(
            habits.flatMap { $0.datesInterVal }.map {
                calendar.dateComponents([.year, .month, .day], from: $0)
            }
        )
    }

    var calendar: Calendar {
        Calendar.current
    }

    var body: some View {
    }

}

#Preview {
    CalenderView()
}
