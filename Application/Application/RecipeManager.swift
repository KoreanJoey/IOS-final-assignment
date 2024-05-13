//
//  RecipeManager.swift
//  Application
//
//  Created by 조성하 on 7/5/2024.
//

import Foundation

class RecipeManager: ObservableObject {
    @Published var recipeData: RecipeData?
    
    let recipieURL = "https://api.spoonacular.com/recipes/findByIngredients"
    let APIKey = "3403d896f67348bdaa5252edb0285c81"
    
    
    func SearchRecipiesByIngredients(ingredient: String){
        let urlString = "\(recipieURL)?ingredients=\(ingredient)"
        
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                        return
                    }
                    if let safeData = data {
                        self.parseJSON(recipeData: safeData)
                    }
                }
                task.resume()
            }
        }
        
        func parseJSON(recipeData: Data) {
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(RecipeData.self, from: recipeData)
                DispatchQueue.main.async {
                    self.recipeData = decodedData
                }
            } catch {
                print(error)
            }
        }
    
    
}
