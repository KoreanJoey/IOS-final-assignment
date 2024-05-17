//
//  AddListView.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI
import Combine
import CoreData

struct AddListView: View {
    @StateObject var addListModel = AddListViewModel()
    @State private var newItemExpiredDate = Date()
    @State var showMainView: Bool = false
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
    @State private var items: [Item] = []
    
    @State var itemName: String
    @State var expireDate: Date
    @State var itemQuantity: String
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: newItemExpiredDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: newItemExpiredDate)!
        
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
                
                VStack{
                    if selectedImage != nil{
                        Image(uiImage: selectedImage!)
                            .resizable()
                            .frame(width: 200, height: 200 )
                    }
                    Button{
                        isPickerShowing = true
                    }label: {
                        Text("Select a Image")
                           
                    }
                }
                .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                    //image picker
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                }
                
                VStack {
                    TextField("Enter name of item here", text: $itemName)
                                .frame(width: 300, height: 40)
                                .padding([.leading, .trailing], 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.green))
                    
                    VStack{DatePicker(selection: $newItemExpiredDate, in: dateRange, displayedComponents: .date){
                        Text("Expirary date")
                            .frame(width: 120, height: 40)
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green))
                    .padding()
                    }
                    
                    .padding()
                 
                    
                    
                    TextField("Enter quentity of item here", text: $itemQuantity)
                        
                        
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
                            saveData()
                        }
                        .disabled(true)
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
    func saveData() {
        let newItem = Item(name: itemName, expireDate: expireDate, quantity: itemQuantity)
        items.append(newItem)
        
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "itemKey")
        }
    }
    
    func loadPlayers() {
        if let data = UserDefaults.standard.data(forKey: "playerKey") {
            if let decoded = try? JSONDecoder().decode([Item].self, from: data) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }
}



#Preview {
    AddListView(itemName: "Apple",expireDate: Date(), quantity: 1)
}
