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
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            ZStack {
                Color.white
                   .ignoresSafeArea()
                VStack{
                    HStack {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.titleBackground)
                                .frame(width: 280.0, height: 35.0)
                                .cornerRadius(7)
                            Text("Add New Item")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 290.0, height: 45.0)
                        .background(.gray)
                        .cornerRadius(12)
                    }
                    .frame(width: screenWidth, height: 90.0)
                    .background(.white)
                    
                    HStack{
                        item.image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                        VStack{
                            Text(item.name)
                                .frame(width:150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(.cyan)))
                            
                            Text(item.expiredDate)
                                .frame(width:150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
                            Text("\(item.quantity) left")
                                .frame(width:150, height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.cyan))
                        }
                    }
                    
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
                .listRowSpacing(15)
                .scrollContentBackground(.hidden)
                .background(LinearGradient(gradient: Gradient(colors: [Color.defaultBackground, Color.white]), startPoint: .top, endPoint: .bottom))
                .frame(width: screenWidth)
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    ItemStatusView(item: listitems[0])
}
