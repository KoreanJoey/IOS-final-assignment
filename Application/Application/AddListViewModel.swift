//
//  AddListViewModel.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI
import UIKit
class AddListViewModel: ObservableObject{
    @Environment(\.managedObjectContext) private var viewContext
    // Fetch request to get all items from Core Data
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) private var items: FetchedResults<Item>
    
    @State private var newItemName: String = ""
    @State private var newItemQuantity: String = ""
    @State private var newItemExpiredDate = Date()
    @State var showMainView: Bool = false
    
    
    // Function to add a new item to Core Data
func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.name = newItemName
            newItem.quantity = Int32(newItemQuantity) ?? 0
            newItem.expiredDate = newItemExpiredDate
            // Set any other properties as needed
            do {
                try viewContext.save()
            } catch {
                // Handle error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // Function to delete selected items from Core Data
func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Handle error
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    // Function to clear input fields after adding an item
func clearFields() {
        newItemName = ""
        newItemQuantity = ""
        newItemExpiredDate = Date()
    }
}

    
    

