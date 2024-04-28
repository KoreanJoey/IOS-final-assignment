//
//  ListItem.swift
//  Application
//
//  Created by 조성하 on 28/4/2024.
//

import Foundation
import SwiftUI

struct ListItem: Codable {
    var name: String
    var description: String
    var expiredDate: Date
    var quantity: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
