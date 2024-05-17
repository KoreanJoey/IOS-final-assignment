////
////  RecipeView.swift
////  Application
////
////  Created by 조성하 on 16/5/2024.
////

import SwiftUI

struct RecipeView: View {
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
            
            if recipeManager.noRecipesFound {
                Text("No recipes matched your ingredient. Please try another ingredient.")
                    .foregroundColor(.red)
                    .padding()
            } else {
                
            List(recipeManager.recipes, id: \.self) { recipe in
                HStack() {
                    URLImageView(urlString: "\(recipe.image)", width: 100, height: 100)
                    Text(recipe.title)
                        .fontWeight(.bold)
                        }
                    }
                }
        }
        .onReceive(recipeManager.$recipes) { recipes in
            if let firstRecipe = recipes.first {
                self.recipeTitle = firstRecipe.title
            }
        }

    }
}

#Preview {
    RecipeView()
}
