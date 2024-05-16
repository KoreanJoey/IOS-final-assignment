//
//  RecipeManager.swift
//  Application
//
//  Created by 조성하 on 7/5/2024.
//

import Foundation

class RecipeManager: ObservableObject {
    //@Published var recipeData: RecipeData?
    @Published var recipeData: Recipe?  // Assuming only one recipe is needed at a time.

    
    let recipieURL = "https://api.spoonacular.com/recipes/findByIngredients"
    let APIKey = "3403d896f67348bdaa5252edb0285c81"
    
    
    func fetchRecipiesByIngredients(ingredient: String){
        guard let encodedIngredient = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
                    print("Invalid ingredient input")
                    return
                }
        
        let urlString = "\(recipieURL)?ingredients=\(encodedIngredient)&apiKey=\(APIKey)&number=1"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        guard let url = URL(string: urlString) else {
                   print("Invalid URL")
                   return
               }
               
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if let error = error {
                       print("Error fetching data: \(error)")
                       return
                   }
                   
                   guard let safeData = data else {
                       print("No data received")
                       return
                   }
                   
                   self.parseJSON(recipeData: safeData)
               }
               task.resume()
        }
        
//        func parseJSON(recipeData: Data) {
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(RecipeData.self, from: recipeData)
//                DispatchQueue.main.async {
//                    self.recipeData = decodedData
//                }
//            } catch {
//                print("Error decoding data: \(error)")
//            }
//        }
    func parseJSON(recipeData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([Recipe].self, from: recipeData)
            DispatchQueue.main.async {
                // Handle or store the decoded recipes here
                if let firstRecipe = decodedData.first {
                    self.recipeData = firstRecipe
                }
            }
        } catch {
            print("Error decoding data: \(error)")
        }
    }

    
    
}
