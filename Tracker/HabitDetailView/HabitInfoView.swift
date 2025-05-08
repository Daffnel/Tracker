//
//  HabitInfoView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI

struct HabitInfoView: View {
    
    var habit: Habit
    
    var body: some View {
        
            HabitDetailsCard(habit: habit)
    }
}

#Preview {
   // HabitInfoView()
}
