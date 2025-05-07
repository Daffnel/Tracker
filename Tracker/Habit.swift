//
//  Habit.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import Foundation
import SwiftData


/* Each habit will be created according to the selected category, i.e. each HabitCategory will consist of subgroups of habits. */
 /* @Model
class HabitCategory {
    
   // var name: String
    var category: Category 
    var icon: String = ""
    var  color: String = ""
    
    @Relationship(deleteRule: .cascade, inverse: \Habit.category)
    var habits: [Habit] = []
    
    
    
    init(category: Category, icon: String, color: String) {

       // self.name = name
        self.category = category
        self.icon = icon
        self.color = color
    }
} */

@Model
class Habit: Identifiable{
    
    @Attribute(.unique)
    var id: UUID = UUID()
    
    var name: String
    var moreInfo: String
    var startDate: Date
    var endDate: Date
    var interval: HabitInterval
    var completedDates: [Date]? = []
    var streak: Int
    var isHabitDone: Bool = false
    var category: Category
    
   // @Relationship
  //  var category: HabitCategory
    
    init(id: UUID, name: String, moreInfo: String, startDate: Date = Date(), endDate: Date = Date(), interval: HabitInterval, completedDates: [Date] = [], streak: Int, isHabitDone: Bool, category: Category ) {
        
        self.interval = interval
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
          return  "heart.fill"
        case .productivity:
           return "checkmark.circle.fill"
        case .relationship:
          return  "person.2.fill"
        case .sleep:
           return "bed.double.fill"
        case .finance:
            return "banknote.fill"
        case .leraning:
            return "book.fill"
        case .creativity:
          return  "paintpalette.fill"
        case .noCategory:
            return ""
        }
    }
    
    //TODO add category icons and color
}

enum HabitInterval: CaseIterable, Hashable, Codable {
    case oncePerDay, everyOtherDay, oncePerWeek, oncePerMonth, oncePerYear
    
    var intervalName: String {
        switch self{
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

// Skapa samtliga kategorier, lagra dessa i SwiftData i samband med att appens kör för första gången,
// Tilldelas även olika färger beroende på kategorier
// Logik --> TrackerApp.swift

/*extension HabitCategory {
    //TODO fix icons and colors!!
    static let initCategory: [HabitCategory] = [
        HabitCategory(category: .health, icon: "heart.fill", color: ""),
        HabitCategory(category: .productivity, icon: "checkmark.circle.fill", color: ""),
        HabitCategory(category: .relationship, icon: "person.2.fill", color: ""),
        HabitCategory(category: .sleep, icon: "bed.double.fill", color: ""),
        HabitCategory(category: .finance, icon: "banknote.fill", color: ""),
        HabitCategory(category: .Home, icon: "house.fill", color: ""),
        HabitCategory(category: .leraning, icon: "book.fill", color: ""),
        HabitCategory(category: .creativity, icon: "paintpalette.fill", color: "")
        
    ]
}*/
