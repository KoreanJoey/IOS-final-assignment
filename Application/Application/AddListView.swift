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
    @Environment(\.managedObjectContext) private var viewContext
    @State private var newItemId = UUID()
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""
    @State private var newItemExpiredDate = Date()
    @State var showMainView: Bool = false
    @State var isPickerShowing = false
    @State var selectedImage: UIImage?
    
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
                    }
                    Button{
                        isPickerShowing = true
                    }label: {
                        ZStack{
                            if selectedImage != nil{
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .frame(width: 200, height: 200 )
                            } else {
                                Image("DefaltImage")
                                    .resizable(resizingMode: .stretch)
                            }
                        }
                        .frame(width: 80, height: 80)
                        .background(.gray)
                        .cornerRadius(12)
                }
                .sheet(isPresented: $isPickerShowing, onDismiss: nil) {
                    //image picker
                    ImagePicker(selectedImage: $selectedImage, isPickerShowing: $isPickerShowing)
                }
                
                VStack {
                    TextField("Enter name of item here", text: $newItemName)
                                .frame(width: 300, height: 40)
                                .padding([.leading, .trailing], 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color("GrayColor")))
                    
                    VStack{DatePicker(selection: $newItemExpiredDate, in: dateRange, displayedComponents: .date){
                        Text("Expirary date")
                            .frame(width: 120, height: 40)
                    }
                    .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color("GrayColor")))
                    .padding()
                    }
                    
                    .padding()
                 
                    
                    
                    TextField("Enter quentity of item here", text: $newItemQuantity)
                        .keyboardType(.numberPad)
                        .onReceive(Just(newItemQuantity)){ newValue in
                            let filtered = newValue.filter {"0123456789".contains($0)}
                                if filtered != newValue{
                                    self.newItemQuantity = filtered
                                }}
                                .frame(width: 300, height: 40)
                                .tint(.cyan)
                                .padding([.leading, .trailing], 10)
                                .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color("GrayColor")))
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
                            let dataImage = selectedImage?.pngData()
                            addListModel.addItem(name: newItemName, expiredDate: newItemExpiredDate, id: UUID(), quantity: Int32(newItemQuantity) ?? 0, image: dataImage!)
                            newItemName = ""
                            newItemQuantity = ""
                            self.showMainView.toggle()
                        }
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 100, height: 50)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.saveButton))
                        .disabled(selectedImage == nil || newItemName.isEmpty || newItemQuantity.isEmpty)
                        }
                }
                .padding(.top, 10.0)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.defaultBackground, Color.white]), startPoint: .top, endPoint: .bottom))
        }
        .fullScreenCover(isPresented: $showMainView, content: {
                  MainView()
              })
        }
    }
}



#Preview {
    AddListView()
}
