//
//  TrackerApp.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import SwiftUI
import SwiftData

@main
struct TrackerApp: App {
    
@AppStorage("appHasData") var appHasData = false
    
    var body: some Scene {
        WindowGroup {
            // TODO change ContentView()
            NewHabitView()
            .modelContainer(for: Habit.self){habit in
                    
                    switch habit {
                    case .success(let container):
                        if !appHasData{
                            for habit in HabitCategory.initCategory {
                                container.mainContext.insert(habit)
                                print("Skapar kategorier")
                            }
                         appHasData = true
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                    
                }
            
        }
    }
}
