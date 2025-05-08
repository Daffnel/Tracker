//
//  ContentView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-05.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    let habit = Habit(name: "", moreInfo: "", interval: .everyOtherDay)

    var body: some View {
        TabView{
            HomeScreen()
                .tabItem {
                    Label("Hem", systemImage: "house")
                }
            NewHabitView(habit: habit)
                .tabItem {
                  Label("Lägg till aktivitet", systemImage: "plus")
              }
            
            HabitsView()
                .tabItem {
                    Label("aktiviteter", systemImage: "list.bullet")
                }
            SettingsView()
                .tabItem {
                    Label("Inställningar", systemImage: "gear")
                }
            
        }
    }

}

#Preview {
    ContentView()
}
