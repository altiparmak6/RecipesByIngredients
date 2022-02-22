//
//  RecipesViewController.swift
//  RecipesByIngredients
//
//  Created by Mustafa Altıparmak on 7.02.2022.
//

import UIKit

class RecipesViewController: UIViewController {
    
    let viewModel = RecipesViewModel(networkManager: NetworkManager())
    
    private let searchBar: UISearchBar = {
        let bar = UISearchBar()
        bar.placeholder = "Spaces between items..."
        bar.showsCancelButton = true
        bar.autocapitalizationType = .none
        bar.returnKeyType = .search
        return bar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(RecipesTableViewCell.self, forCellReuseIdentifier: RecipesTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor.link
        
        searchBar.delegate = self
        navigationController?.navigationBar.topItem?.titleView = searchBar
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(searchTapped))
        
        view.addSubview(tableView)
        
        
        //MARK: - Binding
        viewModel.recipes.bind { [weak self] recipesArray in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    @objc func searchTapped() {
        guard let ingredientsString = searchBar.text else {
            return
        }
        if ingredientsString.isEmpty {
            let ac = UIAlertController(title: "Error",
                                       message: "Please enter ingredients using spaces to search",
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            present(ac, animated: true)
            return
        }
        
        viewModel.fetchRecipes(ingredients: ingredientsString)
    }
    
    
}

extension RecipesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.value?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesTableViewCell.identifier, for: indexPath) as! RecipesTableViewCell
        cell.configure(with: viewModel.recipes.value?[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        
        //in order to download images only when cell is visible, you can use this method. This is where the image downloading part happens
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //DETAIL VIEW
        
        let detailView = DetailViewController()
        navigationController?.pushViewController(detailView, animated: true)
    }
}



extension RecipesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let ingredientsString = searchBar.text else {
            return
        }
        viewModel.fetchRecipes(ingredients: ingredientsString)
    }
}

