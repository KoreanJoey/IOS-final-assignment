//
//  RecipieData.swift
//  Application
//
//  Created by 조성하 on 13/5/2024.
//

import Foundation
struct Recipe: Decodable,Hashable{
    let id: Int
    let title: String
    let image: String
    let imageType: String
    
}


struct RecipeData: Decodable {
    let recipes: [Recipe]
}
