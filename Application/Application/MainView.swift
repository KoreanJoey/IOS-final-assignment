//
//  MainView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI

struct MainView: View {

    @State private var currentIndex: Int = 1
  
    @State private var showAddListView: Bool = false
    @State private var showItemStatusView: Bool = false
    @State private var isSheetShown = false
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
            ZStack {
                Color.gray
                VStack {
                    HStack {
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.titleBackground)
                                .frame(width: 280.0, height: 35.0)
                                .cornerRadius(7)
                            Text("Today: \(DateModel.getTodayString()) \(currentIndex)")
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

                    ZStack {
                        List {
                            ForEach(0..<listitems.count, id:\.self) { index in
                                Button{
                                    self.currentIndex = index
                                    self.showItemStatusView.toggle()
                                } label: {
                                    ItemRow(item: listitems[index])
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
                        
                        VStack {
                            Spacer()
                            HStack{
                                Spacer()
                                Button(action: {
                                    isSheetShown = true
                                }) {
                                    Image(systemName: "magnifyingglass.circle")
                                        .font(.system(size: 50))
                                        .foregroundColor(.green)
                                        .padding()
                                }
                                .sheet(isPresented: $isSheetShown) {
                                    RecipeSearchView()
                                }
                            }
                        }
                    }
                }
                
            }
            .fullScreenCover(isPresented: $showAddListView, content: {
                AddListView()
            })
            
            .fullScreenCover(isPresented: $showItemStatusView, content: {
                ItemStatusView(item: listitems[currentIndex])
            })
        }
        
    }
}

#Preview {
    MainView()
}
