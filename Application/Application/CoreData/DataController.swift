//
//  DataController.swift
//  Application
//
//  Created by Cheuk Hei So on 16/5/2024.
//

import CoreData

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "ListItemModel")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    
}
  


