//
//  Habit.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import Foundation
import SwiftData



@Model
class Habit: Identifiable {

    @Attribute(.unique)
    var id: UUID = UUID()

    var name: String
    var moreInfo: String
    var startDate: Date
    var endDate: Date
    var interval: HabitInterval
    var completedDates: [Date]? = []
    var datesInterVal: [Date]
    var streak: Int
    var isHabitDone: Bool = false
    var category: Category

    // @Relationship
    //  var category: HabitCategory

    init(
        id: UUID = UUID(),
        name: String ,
        moreInfo: String ,
        startDate: Date = Date(),
        endDate: Date = Date(),
        interval: HabitInterval,
        completedDates: [Date] = [],
        datesInterval: [Date] = [],
        streak: Int = 0,
        isHabitDone: Bool = false,
        category: Category = .noCategory
    ) {

        self.interval = interval
        self.id = id
        self.name = name
        self.moreInfo = moreInfo
        self.startDate = startDate
        self.endDate = endDate
        self.datesInterVal = datesInterval
        self.completedDates = completedDates
        self.streak = streak
        self.isHabitDone = isHabitDone
        self.category = category
    }
    
    //TODO något inte rätt med denna fixa!!
    func calculateStreak(datesInterval: [Date], completedDates: [Date]) -> Int {
        let calendar = Calendar.current
        let completed = Set(completedDates.map { calendar.startOfDay(for: $0) })
        let interval = datesInterval
            .map { calendar.startOfDay(for: $0) }
            .sorted(by: >)

        var streak = 0

        for date in interval {
            if completed.contains(date) {
                streak += 1
            } else {
                break 
            }
        }

        return streak
    }
    
    //Update isHabitDone if number of completed dates matches number of dates in interval
    func updateIsHabitDone() {
        if datesInterVal.count == (completedDates?.count ?? 0) {
            isHabitDone = true
        } else {
            isHabitDone = false
        }
    }
    
    //Calculate and returns the progress in percentage
    func progress(habit: Habit) -> Double{
        
        let total = habit.datesInterVal.count
        let completed = habit.completedDates?.count ?? 0
        
        print(total)
        print(completed)
        
        guard total > 0 else {return 0}
        
        return Double(completed) / Double(total)
    }

    //Skapar all datum i intervalet
    static func setDateInterval(start: Date, end: Date, interval: HabitInterval) -> [Date] {
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

enum Category: CaseIterable, Codable, Hashable {
    case health, productivity, relationship, sleep
    case finance, Home, leraning, creativity, noCategory

    
    var categoryName: String {
        switch self {
        case .health:
            return "Hälsa"
        case .productivity:
            return "Produktivitet"
        case .relationship:
            return "Förhållande"
        case .sleep:
            return "Sömn"
        case .finance:
            return "Ekonomi"
        case .Home:
            return "Hushåll"
        case .leraning:
            return "Utbildning"
        case .creativity:
            return "Skapade"
        case .noCategory:
            return "Ingen kategori"
        }
    }

    var categoryIcon: String {
        switch self {
        case .Home:
            return "house.fill"
        case .health:
            return "heart.fill"
        case .productivity:
            return "checkmark.circle.fill"
        case .relationship:
            return "person.2.fill"
        case .sleep:
            return "bed.double.fill"
        case .finance:
            return "banknote.fill"
        case .leraning:
            return "book.fill"
        case .creativity:
            return "paintpalette.fill"
        case .noCategory:
            return "line.3.horizontal.decrease.circle"
        }
    }

   
}

enum HabitInterval: CaseIterable, Hashable, Codable {
    case oncePerDay, everyOtherDay, oncePerWeek, oncePerMonth, oncePerYear

    var intervalName: String {
        switch self {
        case .oncePerDay:
            return "en gång per dag"
        case .oncePerWeek:
            return "en gång i veckan"
        case .everyOtherDay:
            return "varannan dag"
        case .oncePerMonth:
            return "en gång i månaden"
        case .oncePerYear:
            return "en gång per år"
        }
    }
}


