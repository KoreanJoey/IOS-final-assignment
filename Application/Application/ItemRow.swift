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
                        .foregroundColor(Color.black)
                    Text("Best before: \(item.expiredDate)")
                        .foregroundColor(Color.black)
                }
                Spacer()
                ZStack {
                    Color.white
                    Text("\(item.quantity)")
                        .foregroundColor(Color.black)
                }
                .frame(width: 45.0, height: 45.0)
                .cornerRadius(10.0)
                
                Button{
                    //Subtract Quentity
                } label: {
                    ZStack {
                        Color.white
                        Rectangle()
                            .frame(width: 38.0, height: 38.0)
                            .cornerRadius(7.0)
                            .foregroundColor(Color.defaultButton)
                        Rectangle()
                            .frame(width: 26.0, height: 3.75)
                            .foregroundColor(.white)
                            
                    }
                    .frame(width: 45.0, height: 45.0)
                    .cornerRadius(10.0)
                    .shadow(radius: 10)
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.all, 10.0/*@END_MENU_TOKEN@*/)
            .frame(width: 345.0, height: 65.0)
            .background(Color.rowBackground)
            .cornerRadius(7.0)
        }
            .frame(width: 355.0, height: 75.0)
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
