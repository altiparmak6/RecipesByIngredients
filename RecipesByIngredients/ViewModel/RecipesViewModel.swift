//
//  RecipesModelView.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 8.02.2022.
//

import Foundation



struct RecipesViewModel {
    
    let recipes = Observable<[Recipe]>()

    var networkManager: NetworkManagerProtocol
    
    //DEPENDENCY INJECTION
    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }
    
    
    func fetchRecipes(ingredients: String) {
        //get recipes array
        
        let query = ingredients.replacingOccurrences(of: " ", with: ",+")
        print("query: \(query)")
        networkManager.performRequest(with: query) { recipesArray in
            recipes.value = recipesArray
        }
    }
    

}

