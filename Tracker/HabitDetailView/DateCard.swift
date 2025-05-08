//
//  DateCard.swift
//  Tracker
//
//  Created by Daniel A on 2025-05-08.
//

import SwiftUI

struct DateCardView: View {
    
    let date: Date
    @Binding var isChecked: Bool

        var body: some View {
            HStack {
                VStack(alignment: .leading) {
                    Text(date.formatted(date: .long, time: .omitted))
                        .font(.headline)
                    Text(weekday(from: date))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                Spacer()

                Toggle("", isOn: $isChecked)
                    .labelsHidden()
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(radius: 3)
        }

        private func weekday(from date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            return formatter.string(from: date)
        }
}

#Preview {
   // DateCardView()
}
