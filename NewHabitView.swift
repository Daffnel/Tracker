//
//  NewHabitView.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-06.
//

import SwiftUI

struct NewHabitView: View {
    
    @State private var name: String = ""
    @State private var moreInfo: String = ""
    @State  private var startDate: Date = Date()
    @State private  var endDate: Date = Date()
    @State private  var category: Category = .noCategory
    @State private var interval: HabitInterval = .oncePerWeek
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Vad vill du göra?")){
                        TextField("ex. prommenera 15 minuter om dagen", text: $name)
                        Picker("kategori", selection:  $category){
                            ForEach(Category.allCases, id: \.self){category in
                                Text(category.categoryName).tag(category)
                            }
                            
                        }
                    }
                    Section(header: Text("Beskrivning")){
                        TextField("ex. gå stora rundan med hunden 2 gånger om dagen", text: $moreInfo, axis: .vertical)
                    }
                    Section(header: Text("Start och slutdatum")){
                        DatePicker(selection: $startDate){
                            Text("Startdatum")
                           // Text("Ange ett datum för start")
                        }
                        DatePicker(selection: $endDate){
                            Text("Slutdatum")
                        }
                       
                            Picker("Upprepas", selection: $interval){
                                ForEach(HabitInterval.allCases, id:\.self){interval in
                                    
                                    Text(interval.intervalName).tag(interval)
                                }
                            }
                        
                    }
                }
            }
            .navigationTitle("Lägg till en aktivitet")
            
        }
        .padding()
    }
}

#Preview {
   NewHabitView()
}
