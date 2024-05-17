//
//  Item.swift
//  Application
//
//  Created by Sunghyeok Jang on 17/5/2024.
//

import Foundation
import SwiftUI

struct Item: Codable, Hashable, Identifiable {
    let id = UUID()
    var name: String
    var expiredDate: String
    var quantity: Int
    
}

