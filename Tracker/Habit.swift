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
    
    func updateIsHabitDone() {
        if datesInterVal.count == (completedDates?.count ?? 0) {
            isHabitDone = true
        } else {
            isHabitDone = false
        }
    }

}

enum Category: CaseIterable, Codable, Hashable {
    case health, productivity, relationship, sleep
    case finance, Home, leraning, creativity, noCategory

    //TODO REMOVE AFTER CHECK - osäker om SwiftData accpeterar computed property?
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

    //TODO add category icons and color
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


