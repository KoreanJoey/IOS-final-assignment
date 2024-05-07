//
//  MainView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI

struct MainView: View {
    
    @State private var showAddListView: Bool = false
    
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
                            ItemRow(item: listItem)
                        }
                        .listStyle(PlainListStyle())
                        .padding()
                }
            }
            .fullScreenCover(isPresented: $showAddListView, content: {
                AddListView(item: listitems[0])
            })
    }
}

#Preview {
    MainView()
}
