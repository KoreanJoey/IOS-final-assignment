//
//  MainView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI

struct MainView: View {
    @State var currentId: Int = 1
    @State private var showAddListView: Bool = false
    @State private var showItemStatusView: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            ZStack {
                Color.gray
                VStack() {
                    HStack() {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.titleBackground)
                                .frame(width: 280.0, height: 35.0)
                                .cornerRadius(7)
                            Text("Today: \(DateModel.getTodayString())")
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                        }
                        .frame(width: 290.0, height: 45.0)
                        .background(.gray)
                        .cornerRadius(12)
                        Button{
                            self.showAddListView.toggle()
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .frame(width: 45.0, height: 45.0)
                                .font(.system(size: 42))
                                .foregroundColor(Color.addButtonBackground)
                                .background(Color.defaultButton)
                                .cornerRadius(12)
                        }
                    }
                    .frame(width: screenWidth, height: 90.0)
                    .background(.white)
                    
                    //                    List(listitems, id:\.id) {
                    //                        listItem in
                    //                        Button{
                    //                            currentId = listItem.id
                    //                            let item = listitems.first(where: {$0.id == listItem.id })
                    //                            self.showItemStatusView.toggle()
                    //                        } label: {
                    //                            ItemRow(item: listItem)
                    //                        }
                    //                    }
                    //                    .listStyle(PlainListStyle())
                    //                    .padding()
                    List {
                        ForEach(listitems, id: \.id) { listItem in
                            Button{
                                self.showItemStatusView.toggle()
                            } label: {
                                ItemRow(item: listItem)
                            }
                            
                        }
                        .listRowInsets(EdgeInsets())
                        .listStyle(PlainListStyle())
                    }
                    .listRowSpacing(15)
                    .scrollContentBackground(.hidden)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.defaultBackground, Color.white]), startPoint: .top, endPoint: .bottom))
                    .frame(width: screenWidth)
                    .ignoresSafeArea()
                }
                
            }
            .fullScreenCover(isPresented: $showAddListView, content: {
                AddListView()
            })
            
            .fullScreenCover(isPresented: $showItemStatusView, content: {
                ItemStatusView(item: listitems[currentId])
            })
        }
        
    }
}

#Preview {
    MainView()
}
