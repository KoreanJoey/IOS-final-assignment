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
    @State var selectedDate: Date = Date()
    @State var showMainView: Bool = false
    @State var quantity: String = ""
    @State var newItem: ListItem
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: selectedDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: selectedDate)!
        
        return min...max
    }
    
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let screenHeight = geometry.size.height
        ZStack {
            Color.gray
                .ignoresSafeArea()
            VStack{
                HStack {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.titleBackground)
                            .frame(width: 280.0, height: 35.0)
                            .cornerRadius(7)
                        Text("Add New Item")
                            .foregroundColor(Color.black)
                            .multilineTextAlignment(.center)
                    }
                    .frame(width: 290.0, height: 45.0)
                    .background(.gray)
                    .cornerRadius(12)
                }
                .frame(width: screenWidth, height: 90.0)
                .background(.white)
                
                VStack {
                    TextField("Enter name of item here", text: $newItem.name)
                                .frame(width: 300, height: 40)
                                .padding([.leading, .trailing], 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green))
                    
                    VStack{DatePicker(selection: $selectedDate, in: dateRange, displayedComponents: .date){
                        Text("Expirary date")
                            .frame(width: 120, height: 40)
                        Button("Save date"){
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            let selectedDate2 = dateFormatter.string(from: selectedDate)
                            newItem.expiredDate = selectedDate2}
                        .background(Color.clear)
                        .frame(width: 100, height: 40)
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green))
                    .padding()
                    }
                    
                    .padding()
                 
                    
                    
                    TextField("Enter quentity of item here", value: $newItem.quantity, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .onReceive(Just(String(newItem.quantity))){ newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                                if filtered != newValue{
                                    self.quantity = filtered
                                }}
                                .frame(width: 300, height: 40)
                                .tint(.cyan)
                                .padding([.leading, .trailing], 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green))
                                Spacer()
                    
                    Label("Notify me on...", systemImage: "")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.green))
                        .padding()
                        
                    HStack{
                        Button("1 day before expire"){}
                            .font(.title)
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.teal))
                        Button("4 days before expire"){}
                            .font(.title)
                            .foregroundColor(.black)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.teal))
                        
                    }
                    Spacer()
                    
                    HStack{
                        Button("Back") {
                            self.showMainView.toggle()
                        }
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.backButton))
                        
                        Button("Save"){
                            save(newItem, filename:"ListItemData.json")
                        }
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.saveButton))
                        }
                }
                .padding(.top, 10.0)
                .background(LinearGradient(gradient: Gradient(colors: [Color.defaultBackground, Color.white]), startPoint: .top, endPoint: .bottom))
                
            }
        }
        .fullScreenCover(isPresented: $showMainView, content: {
                  MainView()
              })
        }
    }
}


#Preview {
    AddListView(newItem: listitems[0])
}
