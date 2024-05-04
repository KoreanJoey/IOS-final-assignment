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
                Label("Add New Object", systemImage: "")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding()
                Text("Food Name")
                    .font(.title)
                TextField("Product Name", text: $listModel.productName)
                            .frame(width: 200, height: 50)
                            .tint(.cyan)
                            .padding([.leading, .trailing], 10)
                            .textFieldStyle(.roundedBorder)
                            
                Text("Expiry's on")
                Button("Custom Date"){}
                Button("Expire on 1 day"){}
                Button("Expire on 4 days"){}
                Button("Expire on 7 days"){}
                
                Text("Notify me on...")
                Button("1 day before expire"){}
                Button("4 days before expire"){}
                
                
                Button("Save") {
                    
                }
                .font(.title)
                .foregroundColor(.black)
                .frame(width: 100, height: 50)
                .background(RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange))
                
            }
        }    }
        
}

#Preview {
    AddListView()
}
