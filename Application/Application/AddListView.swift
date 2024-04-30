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
       
        VStack{
            Color.cyan
            Label("Add New Object", systemImage: "")
                .multilineTextAlignment(.center)
                .font(.title)
                .padding()
            TextField("Product Name", text: $listModel.productName)
                        .frame(width: 200, height: 50)
                        .tint(.cyan)
                        .padding([.leading, .trailing], 10)
                        .textFieldStyle(.roundedBorder)
                        
            Text("Hello")
            
        }
        .offset(y:-650)
        .background(.cyan)
    }
        
}

#Preview {
    AddListView()
}
