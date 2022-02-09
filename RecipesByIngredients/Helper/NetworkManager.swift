//
//  NetworkManager.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 8.02.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func performRequest(with query: String, completionHandler: @escaping ([Recipe]) -> ())
}

struct NetworkManager: NetworkManagerProtocol{
    private static let apiKey = "1f4e274353f34cd4957b1c125db6f60e"
    private let baseUrl = "https://api.spoonacular.com/recipes/findByIngredients?apiKey=\(apiKey)&ingredients="
    

    
    
    func performRequest(with query: String, completionHandler: @escaping ([Recipe]) -> ()) {
        let urlString = baseUrl + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error found")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            parseJSON(with: data, completionHandler: completionHandler)
        }
        
        task.resume()
    }
    
    
    
    private func parseJSON(with data: Data, completionHandler: @escaping ([Recipe]) -> ()) {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Recipe].self, from: data)
            for recipe in decodedData {
                print(recipe.id)
                print(recipe.image)
            }
            completionHandler(decodedData)
        } catch {
            print("Error parsing JSON")
        }
    }
}
