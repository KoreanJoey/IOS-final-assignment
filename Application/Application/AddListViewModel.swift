//
//  AddListViewModel.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import SwiftUI
import CoreData
class AddListViewModel: ObservableObject{
    let container: NSPersistentContainer
    @Published var savedEntities: [ItemEntity] = []
    init(){
        container = NSPersistentContainer(name: "ListItemModel")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print("Error Loading Core Date. \(error)")
            }
        }
        fetchItem()
    }
    
    func fetchItem(){
        let request = NSFetchRequest<ItemEntity>(entityName: "ItemEntity")
        do{
            savedEntities = try container.viewContext.fetch(request)
        } catch let error{
            print("Error fetching. \(error)")
        }
    }
    
    func addItem(name: String, expiredDate: Date, id: UUID, quantity: Int32, image: Data){
        let newItem = ItemEntity(context: container.viewContext)
        newItem.name = name
        newItem.expiredDate = expiredDate
        newItem.quantity = quantity
        newItem.id = id
        newItem.image = image
        saveItem()
    }
    
    func subtractQuantity(entity: ItemEntity){
        let currentQuantity = entity.quantity
        let newQuantity = currentQuantity - 1
        entity.quantity = newQuantity
        saveItem()
    }
    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else{return}
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveItem()
    }
    
    func saveItem(){
        do{
           try container.viewContext.save()
            fetchItem()
        }
        catch let error{
            print("Error Saving \(error)")
        }
    }
}

    
    

