//
//  ItemDescriptionView.swift
//  Application
//
//  Created by 조성하 on 5/5/2024.
//

import SwiftUI

struct ItemStatusView: View {
    @State private var index: Int = 0
    var item : ListItem
    
    @State private var showMainView: Bool = false
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
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
        
        HStack{
            Button("Back") {
                self.showMainView.toggle()
            }
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 100, height: 50)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color("BackButtonColor")))
            }
        
        .fullScreenCover(isPresented: $showMainView, content: {
                  MainView()
              })
    }
}

#Preview {
    ItemStatusView(item: listitems[0])
}
