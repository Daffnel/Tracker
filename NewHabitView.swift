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
    @State private  var category: Category = .Home
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    Section(header: Text("Vad vill du göra?")){
                        TextField("ex. prommenera 15 minuter om dagen", text: $name)
                    }
                    Section(header: Text("Beskrivning")){
                        TextField("Gå stora rundan med hunden 2 gånger om dagen", text: $moreInfo, axis: .vertical)
                    }
                    Section(header: Text("Start och slutdatum")){
                        DatePicker(selection: $startDate)
                        // more code to come start, end date
                    }
                }
            }
            .navigationTitle("Lägg till en aktivitet")
        }
        .padding()
    }
}

#Preview {
  //  NewHabitView()
}
