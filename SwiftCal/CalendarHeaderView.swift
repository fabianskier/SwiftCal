//
//  CalendarHeaderView.swift
//  SwiftCal
//
//  Created by Oscar Cristaldo on 2022-11-11.
//

import SwiftUI

struct CalendarHeaderView: View {
    
    let daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"]
    var font: Font = .body
    
    var body: some View {
        HStack {
            ForEach(daysOfWeek, id: \.self) { dayOfWeek in
                Text(dayOfWeek)
                    .font(font)
                    .fontWeight(.black)
                    .foregroundColor(.orange)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

struct CalendarHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHeaderView()
    }
}
