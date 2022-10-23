//
//  CollectionViewTableViewCell.swift
//  Movie Streamer
//
//  Created by Benjamin Heflin on 10/23/22.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {

    static let identifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPurple
    }

    required init?(coder:NSCoder) {
        fatalError()
    }
    
}
