//
//  Observable.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 9.02.2022.
//

import Foundation

class Observable <T> {
    
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    
    var observer: ((T?) -> ())?
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
    
    //Can be multiple observers
    
}
