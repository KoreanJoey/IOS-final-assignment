//
//  ItemDescriptionView.swift
//  Application
//
//  Created by 조성하 on 5/5/2024.
//

import SwiftUI

struct ItemStatusView: View {
    var item : ListItem
    
    var body: some View {
        VStack {
            Text(item.name)
                .frame(width:300, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
        }
        Text(item.expiredDate)
            .frame(width:300, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
        Text("\(item.quantity) left")
            .frame(width:300, height: 50)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
        
        Text("The food recipe list would be here")
            .frame(width:300, height:400)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue))
        
        HStack{
            Button("Back") {
                
            }
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 100, height: 50)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.red))
            }
    }
}

#Preview {
    ItemStatusView(item: listitems[0])
}
