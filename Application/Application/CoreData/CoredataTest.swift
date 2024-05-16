//
//  CoredataTest.swift
//  Application
//
//  Created by Cheuk Hei So on 16/5/2024.
//
import SwiftUI
import CoreData

struct CoreDataTestView: View {
    @Environment(\.managedObjectContext)
    var context
    
    @FetchRequest(sortDescriptors: [])
    var items: FetchedResults<Item>
    
    var body: some View{
        VStack{
            Button(action:{
                let newItem = Item(context: context)
                newItem.expiredDate = Date.now
                newItem.quantity = Int32("1") ?? 0
                newItem.name = "Hello"
                newItem.id = UUID()
                try? context.save()
            }, label:{
                Text("Add Item")
            })
            
            List{
                ForEach(items, id:\.self) {newItem in Text(newItem.name ?? "")}
            }
        }
    }
}

#Preview {
    CoreDataTestView()
}
