//
//  HomeViewController.swift
//  Movie Streamer
//
//  Created by Benjamin Heflin on 10/23/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let sectionTitles: [String] = [
        "Top Ranked",
        "Oldies and Goodies",
        "Newest Releases",
        "Simple Beginnings",
        "Fallen Timeline",
        "Child Timeline",
        "Adult Timeline"
    ]
    
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
        let headerView = ZeldaHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 320))
        homeFeedTable.tableHeaderView = headerView
    }
    
    private func configureNavbar() {
        var imageTriforce = UIImage(named: "triforceLogo")
        imageTriforce = imageTriforce?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageTriforce, style: .done, target: self, action: nil)
        
        var imageHylianSheild = UIImage(named: "hylianSheildLogo")
        imageHylianSheild = imageHylianSheild?.withRenderingMode(.alwaysOriginal)
        
        var imageMasterSword = UIImage(named: "masterSwordLogo")
        imageMasterSword = imageMasterSword?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: imageHylianSheild, style: .done, target: self, action: nil),
            UIBarButtonItem(image: imageMasterSword, style: .done, target: self, action: nil)
        ]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y:min(0, -offset))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont(name: "BodoniSvtyTwoITCTT-BookIta", size: 20)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
    }
    
    
    
    
}
