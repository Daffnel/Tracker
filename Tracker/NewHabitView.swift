//
//  NewHabitView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-06.
//

import SwiftData
import SwiftUI

struct NewHabitView: View {

    @Environment(\.modelContext) private var modelContext
    @Bindable  var habit: Habit
  
    var isFormValid: Bool {
        !habit.name.trimmingCharacters(in: .whitespaces).isEmpty
        && !habit.moreInfo.trimmingCharacters(in: .whitespaces).isEmpty
        && habit.endDate >= habit.startDate
    }

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Vad vill du göra?")) {
                    TextField("ex. prommenera 15 minuter om dagen", text: $habit.name)
                    Picker("kategori", selection: $habit.category) {
                        ForEach(Category.allCases, id: \.self) { category in
                            HStack {
                                Text(category.categoryName).tag(category)
                                Image(systemName: category.categoryIcon)
                            }
                        }
                        .padding(8)

                    }
                }
                Section(header: Text("Beskrivning")) {
                    TextField(
                        "ex. gå stora rundan med hunden 2 gånger om dagen",
                        text: $habit.moreInfo,
                        axis: .vertical
                    )
                    .lineLimit(3...6)
                }
                Section(header: Text("Start och slutdatum")) {
                    DatePicker(
                        selection: $habit.startDate,
                        displayedComponents: .date
                    ) {
                        Text("Startdatum")
                        // Text("Ange ett datum för start")
                    }

                    DatePicker(selection: $habit.endDate, displayedComponents: .date)
                    {
                        Text("Slutdatum")
                    }

                    Picker("Upprepas", selection: $habit.interval) {
                        ForEach(HabitInterval.allCases, id: \.self) {
                            interval in
                            Text(interval.intervalName).tag(interval)
                        }
                    }
                }
                Section {
                    Button("Spara") {
                        saveHabit()
                    
                        
                        
                        print("save button pressed")
                    }
                    .disabled(!isFormValid)
                    .buttonStyle(.borderedProminent)
                }

            }
            
            .navigationTitle("Lägg till en aktivitet")  // lägger text separat
            
        }

    }

    func saveHabit() {

        let dateInterval = Habit.setDateInteval(
            start: habit.startDate,
            end: habit.endDate,
            interval: habit.interval
        )

        let newHabit = Habit(name: habit.name, moreInfo: habit.moreInfo, startDate: habit.startDate, endDate: habit.endDate, interval: habit.interval, datesInterval: dateInterval, streak: 0, isHabitDone: false, category: habit.category)
       
        

        print(dateInterval)

        modelContext.insert(newHabit)
    }

}

#Preview {
    //NewHabitView(habit: Habit())
}
