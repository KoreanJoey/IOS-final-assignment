//
//  ListItem.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import Foundation
import SwiftUI

struct ListItem: Codable, Hashable {
    let id: Int
    var name: String
    var description: String
    var expiredDate: String
    var quantity: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    
    
}
