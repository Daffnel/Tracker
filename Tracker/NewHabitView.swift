//
//  NewHabitView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-06.
//

import SwiftUI
import SwiftData

struct NewHabitView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var name: String = ""
    @State private var moreInfo: String = ""
    @State  private var startDate: Date = Date()
    @State private  var endDate: Date = Date()
    @State private  var category: Category = .noCategory
    @State private var interval: HabitInterval = .oncePerWeek
    
    
    
    var isFormValid: Bool {
            !name.trimmingCharacters(in: .whitespaces).isEmpty &&
        !moreInfo.trimmingCharacters(in: .whitespaces).isEmpty &&
        endDate >= startDate
        }
    
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Vad vill du göra?")){
                    TextField("ex. prommenera 15 minuter om dagen", text: $name)
                    Picker("kategori", selection:  $category){
                        ForEach(Category.allCases, id: \.self){category in
                            HStack{
                                Text(category.categoryName).tag(category)
                                Image(systemName: category.categoryIcon)
                            }
                        }
                        .padding(8)
                        
                    }
                }
                Section(header: Text("Beskrivning")){
                    TextField("ex. gå stora rundan med hunden 2 gånger om dagen", text: $moreInfo, axis: .vertical)
                        .lineLimit(3...6)
                }
                Section(header: Text("Start och slutdatum")){
                    DatePicker(selection: $startDate, displayedComponents: .date){
                        Text("Startdatum")
                        // Text("Ange ett datum för start")
                    }
                
                    
                    DatePicker(selection: $endDate, displayedComponents: .date){
                        Text("Slutdatum")
                    }
                    
                    Picker("Upprepas", selection: $interval){
                        ForEach(HabitInterval.allCases, id:\.self){interval in
                            Text(interval.intervalName).tag(interval)
                        }
                    }
                }
                Section(){
                    Button("Spara"){
                        saveHabit()
                        print("save button pressed")
                    }
                    .disabled(!isFormValid)
                    .buttonStyle(.borderedProminent)
                }
                
            }
                
            .navigationTitle("Lägg till en aktivitet") // lägger text separat
            
            }
            
            
        }
    
    func saveHabit(){
        let habit = Habit(id: UUID(), name: name, moreInfo: moreInfo, interval: interval, streak: 0, isHabitDone: false, category: category)
        
        modelContext.insert(habit)
        
    }
        
}

#Preview {
   NewHabitView()
}
