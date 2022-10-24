//
//  SearchViewController.swift
//  Movie Streamer
//
//  Created by Benjamin Heflin on 10/23/22.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var gameTitles: [Game] = [Game]()
    
    private let discoverTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    
    private let searchController: UISearchController = {
        
       let controller = UISearchController(searchResultsController: SearchResultsViewController())
        controller.searchBar.placeholder = "Search for a Zelda game"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(discoverTable)
        discoverTable.delegate = self
        discoverTable.dataSource = self
        
        navigationItem.searchController = searchController
        navigationController?.navigationBar.tintColor = .white
        
        getDiscoverZeldaGames()
    }
    
    private func getDiscoverZeldaGames() {
        APICaller.shared.getDiscoverZeldaGames() {[weak self] result in
            switch result {
            case .success(let games):
                self?.gameTitles = games
                DispatchQueue.main.sync {
                    self?.discoverTable.reloadData()
                    
                }
            case .failure(let error):
                print(error.localizedDescription)
                }
            }
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        discoverTable.frame = view.bounds
    }
    

}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let title = gameTitles[indexPath.row]
        let model = TitleViewModel(titleName: title.name ?? "Unknown Name", posterAddress: title.name ?? "Unknown Name")
        cell.configure(with: model)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    
}
