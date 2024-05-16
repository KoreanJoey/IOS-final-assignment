//
//  ListItem+CoreDataProperties.swift
//  Application
//
//  Created by Cheuk Hei So on 16/5/2024.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var quantity: Int32
    @NSManaged public var expiredDate: Date?
    
}

extension Item : Identifiable {

}
