//
//  ItemModel.swift
//  Application
//
//  Created by Sunghyeok Jang on 17/5/2024.
//

import Foundation
import SwiftUI

struct Item: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var expireDate: Date
    var quantity: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
}
