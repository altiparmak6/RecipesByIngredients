//
//  Result.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 7.02.2022.
//

import Foundation



struct Recipe: Decodable {
    let id: Int
    let title: String
    let image: String
    let missedIngredientCount: Int
}
