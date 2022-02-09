//
//  RecipesTableViewCell.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 7.02.2022.
//

import UIKit

class RecipesTableViewCell: UITableViewCell {
    
    static let identifier = "RecipesTableViewCell"
    
    private let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "fork.knife.circle.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ingredientLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.textColor = .systemRed
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(recipeImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(ingredientLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with recipe: Recipe?) {
        guard let recipe = recipe else {
            return
        }
        titleLabel.text = recipe.title
        ingredientLabel.text = "Number of extra ingredients: \(recipe.missedIngredientCount)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            recipeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            recipeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            recipeImageView.widthAnchor.constraint(equalToConstant: 100),
            recipeImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: recipeImageView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -110),
            
            ingredientLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            ingredientLabel.leadingAnchor.constraint(equalTo: recipeImageView.trailingAnchor, constant: 10)
        ])
    }
    
}
