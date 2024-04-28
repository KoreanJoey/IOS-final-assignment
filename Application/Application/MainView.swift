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
                HStack {
                    NavigationLink{
                        AddListView()
                    } label: {
                        Image(systemName: "plus.app.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white)
                            .position(x: 340,y: 10)
                    }
                    .padding()
                }
                ScrollView {
                    
                }

                
            }
        }
    }
}

#Preview {
    MainView()
}
