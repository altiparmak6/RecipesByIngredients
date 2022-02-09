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
        bar.placeholder = "Enter ingredients..."
        bar.showsCancelButton = true
        bar.autocapitalizationType = .none
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
        guard let query = searchBar.text else {
            return
        }
        viewModel.fetchRecipes(query: query)
    }
    
    
}

extension RecipesViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.value?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipesTableViewCell.identifier, for: indexPath) as! RecipesTableViewCell
        cell.configure(with: viewModel.recipes.value?[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //DETAIL VIEW
    }
}



extension RecipesViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}
