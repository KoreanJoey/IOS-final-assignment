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
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button{
                            self.showAddListView.toggle()
                        } label: {
                            Image(systemName: "plus.app.fill")
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                    List(listitems, id:\.id) {
                        listItem in
                        Button{
//                            currentId = listItem.id
//                            let item = listitems.first(where: {$0.id == listItem.id })
                            self.showItemStatusView.toggle()
                        } label: {
                            ItemRow(item: listItem)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .padding()
                }
            }
            .fullScreenCover(isPresented: $showAddListView, content: {
                AddListView(item: listitems[0])
            })
        
            .fullScreenCover(isPresented: $showItemStatusView, content: {
                            ItemStatusView(item: listitems[currentId])
                        })
    }
}

#Preview {
    MainView()
}
