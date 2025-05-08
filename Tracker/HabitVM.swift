//
//  HabitVM.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-07.
//

import Foundation
import SwiftData
import SwiftUI


extension Habit {
    
   
    
    //Skapar all datum i intervalet
    static func setDateInteval(start: Date, end: Date, interval: HabitInterval) -> [Date] {
        var dates: [Date] = []
            var currentDate = start
            let calendar = Calendar.current

            let step: DateComponents

            switch interval {
            case .oncePerDay:
                step = DateComponents(day: 1)
            case .everyOtherDay:
                step = DateComponents(day: 2)
            case .oncePerWeek:
                step = DateComponents(day: 7)
            case .oncePerMonth:
                step = DateComponents(month: 1)
            case .oncePerYear:
                step = DateComponents(year: 1)
            }

            while currentDate <= end {
                dates.append(currentDate)
                if let nextDate = calendar.date(byAdding: step, to: currentDate) {
                    currentDate = nextDate
                } else {
                    break
                }
            }

            return dates
    }
    
}
