//
//  Habit.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import Foundation
import SwiftData


/* Each habit will be created according to the selected category, i.e. each HabitCategory will consist of subgroups of habits. */

@Model
class HabitCategory {
    
   // var name: String
    var category: Category
    var icon: String
    var  color: String
    
    @Relationship(deleteRule: .cascade, inverse: \Habit.category)
    var habits: [Habit] = []
    
    
    
    init(category: Category, icon: String, color: String) {

       // self.name = name
        self.category = category
        self.icon = icon
        self.color = color
    }
}

@Model
class Habit{
    
    @Attribute(.unique)
    var id: UUID = UUID()
    
    var name: String
    var moreInfo: String
    var startDate: Date
    var endDate: Date
    var completedDates: [Date]? = []
    var streak: Int
    var isHabitDone: Bool = false
    
   // @Relationship
    var category: HabitCategory
    
    init(id: UUID, name: String, moreInfo: String, startDate: Date = Date(), endDate: Date = Date(), completedDates: [Date] = [], streak: Int, isHabitDone: Bool, category: HabitCategory ) {
        self.id = id
        self.name = name
        self.moreInfo = moreInfo
        self.startDate = startDate
        self.endDate = endDate
        self.completedDates = completedDates
        self.streak = streak
        self.isHabitDone = isHabitDone
        self.category = category
    }
    
    
    
}

enum Category: CaseIterable, Codable {
    case health, productivity, relationship, sleep
    case finance, Home, leraning, creativity
    
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
        }
    }
}

// Skapa samtliga kategorier, lagra dessa i SwiftData i samband med att appens kör för första gången,
// Tilldelas även olika färger beroende på kategorier
// Logik --> TrackerApp.swift

extension HabitCategory {
    //TODO fix icons and colors!!
    static let initCategory: [HabitCategory] = [
        HabitCategory(category: .health, icon: "", color: ""),
        HabitCategory(category: .productivity, icon: "", color: ""),
        HabitCategory(category: .relationship, icon: "", color: ""),
        HabitCategory(category: .sleep, icon: "", color: ""),
        HabitCategory(category: .finance, icon: "", color: ""),
        HabitCategory(category: .Home, icon: "", color: ""),
        HabitCategory(category: .leraning, icon: "", color: ""),
        HabitCategory(category: .creativity, icon: "", color: "")
        
    ]
}
