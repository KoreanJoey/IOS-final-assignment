//
//  AddListView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI
import Combine

struct AddListView: View {
    @StateObject var listModel = addListViewModel()
    @State private var selectedDate: Date = Date()
    @State private var showMainView: Bool = false
    @State private var quantity: String = "0"
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: selectedDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: selectedDate)!
        
        return min...max
    }
    
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
                VStack{DatePicker(selection: $selectedDate, in: dateRange, displayedComponents: .date){
                    Text("Expirary date")
                        .frame(width: 120, height: 40)
                }
                .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.green))
                .padding()
                }
                .padding()
             
                
                
                TextField("Enter quentity of item here", text: $quantity)
                    .keyboardType(.numberPad)
                    .onReceive(Just(quantity)){ newValue in
                        let filtered = newValue.filter {"0123456789".contains($0)}
                            if filtered != newValue{
                                self.quantity = filtered
                            }}
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
                        self.showMainView.toggle()
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
        .fullScreenCover(isPresented: $showMainView, content: {
                  MainView()
              })
        }
        
}


#Preview {
    AddListView()
}
