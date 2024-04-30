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
                    ScrollView {
//                        List(listitems) {
//                            listitem in label: {
//                                ItemRow(item: listitem)
//                            }
//                        }
                        Text("hi")
                    }

                }
                                

                
            }
        }
    }
}

#Preview {
    MainView()
}
