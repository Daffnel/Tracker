//
//  HabitInfoView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI

struct HabitInfoView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Bindable var habit: Habit
    
    var body: some View {
        
            HabitDetailsCard(habit: habit)
            
            HabitDateCardsView(habit: habit)
      
        
    }
    
}

#Preview {
   // HabitInfoView()
}
