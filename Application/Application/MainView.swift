//
//  MainView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                VStack {
                    NavigationLink{
                        AddListView()
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                    }
                    .padding()
                    .position(x: 340,y: 10)
                    VStack {
                        //id: \.id -> suit for complicated data model.
                        //there should be id in struct or class
                        //id: \.self -> suit for simple data type(integer, string)
                        List(listitems, id:\.id) {
                            listItem in
                            ItemRow(item: listItem)
                            
                        }
                    }
                    .padding()
                    Spacer()

                }
                                

                
            }
        }
    }
}

#Preview {
    MainView()
}
