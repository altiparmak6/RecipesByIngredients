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
    
    func fetchRecipes(query: String) {
        //get recipes array
        networkManager.performRequest(with: query) { recipesArray in
            recipes.value = recipesArray
        }
    }
    

}

