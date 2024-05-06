//
//  AddListView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI

struct AddListView: View {
    @StateObject var listModel = addListViewModel()
    
    var body: some View {
       
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack{
                Label("Add New item", systemImage: "")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green))
                    .padding()
                
                TextField("Enter name of item here", text: $listModel.productName)
                            .frame(width: 300, height: 40)
                            .padding([.leading, .trailing], 10)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green))
                           
                
                TextField("Pick expiry date here", text: $listModel.productName)
                            .frame(width: 300, height: 40)
                            .tint(.cyan)
                            .padding([.leading, .trailing], 10)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green))
                
                TextField("Enter quentity of item here", text: $listModel.productName)
                            .frame(width: 300, height: 40)
                            .tint(.cyan)
                            .padding([.leading, .trailing], 10)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.green))
                
                Text("Expiry's on")
                Button("Custom Date"){}
                Button("Expire on 1 day"){}
                Button("Expire on 4 days"){}
                Button("Expire on 7 days"){}
                
                Text("Notify me on...")
                Button("1 day before expire"){}
                Button("4 days before expire"){}
                
                HStack{
                    Button("Back") {
                        
                    }
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.red))
                    
                    Button("Save"){
                    }
                    .font(.title)
                    .foregroundColor(.black)
                    .frame(width: 100, height: 50)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.green))
                    }
                }
            }
        }
        
}

#Preview {
    AddListView()
}
