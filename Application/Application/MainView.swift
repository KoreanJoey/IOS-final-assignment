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
    @StateObject var addListModel = AddListViewModel()
    @State private var isSheetShown = false
    
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
                    
                    ZStack{
                    List{
                        ForEach(addListModel.savedEntities){ entity in
                            Button{
                                self.showItemStatusView.toggle()
                            }label:{ZStack{
                                    Color.white
                                    HStack {
                                        Image(uiImage: UIImage(data: entity.image ?? Data()) ?? UIImage())
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                                        VStack {
                                            Text(entity.name ?? "No Name")
                                                .foregroundColor(Color.black)
                                            Text("\(String(describing: entity.expiredDate))")
                                                .foregroundColor(Color.black)
                                    }
                                    Spacer()
                                    ZStack {
                                        Color.white
                                        Text("\(entity.quantity)")
                                            .foregroundColor(Color.black)
                                    }
                                    .frame(width: 45.0, height: 45.0)
                                    .cornerRadius(10.0)
                                    
                                        Button{
                                            addListModel.subtractQuantity(entity: entity)
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
                        }
                        .onDelete(perform: addListModel.deleteItem)
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
