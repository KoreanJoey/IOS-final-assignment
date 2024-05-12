//
//  ItemRow.swift
//  Application
//
//  Created by 조성하 on 30/4/2024.
//

import SwiftUI

struct ItemRow: View {
    var item : ListItem
    
    var body: some View {
        
        ZStack{
            Color.white
            HStack {
                item.image
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                VStack {
                    Text(item.name)
                    Text(item.expiredDate)
//                    Text(DateModel.getTodayDateString())
                    if let daysRemaining = DateModel.calculateRemainingDay(expireDateString: item.expiredDate) {
                        Text("\(daysRemaining)")
                    } else {
                        Text("invalid date format")
                    }
                }
                Spacer()
                VStack {
                    Text("\(item.quantity)")
                }
                Rectangle()
                    .padding()
                    .frame(width: 45.0, height: 45.0)
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            .frame(width: 370.0, height: 65.0)
            .background(Color.rowBackground)
            .cornerRadius(7.0)
        }
            .frame(width: 380.0, height: 75.0)
            .cornerRadius(10.0)
            
    }
    
    func expireDateColor() -> Color {
        if(true) {
            return .red
        }
    }
}

#Preview {
    Group {
        ItemRow(item: listitems[0])
    }
    
}
