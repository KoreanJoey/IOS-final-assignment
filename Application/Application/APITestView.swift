//
//  APITestView.swift
//  Application
//
//  Created by 조성하 on 16/5/2024.
//

import SwiftUI

struct APITestView: View {
    @State private var ingredientIHave = ""
    @State private var recipeTitle = ""
    @State private var recipeManager = RecipeManager()
    
    
    var body: some View {
        VStack{
            TextField("Enter ingredient", text: $ingredientIHave )
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Search") {
                recipeManager.fetchRecipiesByIngredients(ingredient: ingredientIHave)
            }
            .padding()
            
            Text("Recipe: \(recipeTitle)")
                .padding()
        }
        .onReceive(recipeManager.$recipeData) {
            data in
            if let data = data {
                recipeTitle = "\(data.title)"
            }
        }
    }
}

#Preview {
    APITestView()
}
