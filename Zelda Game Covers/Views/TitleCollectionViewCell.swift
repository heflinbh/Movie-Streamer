//
//  TitleCollectionViewCell.swift
//  Zelda Game Covers
//
//  Created by Benjamin Heflin on 10/23/22.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    
    public func configure(with model: String) {
        
        print("Look here!! - " + model)
        
        posterImageView.backgroundColor = .blue
        posterImageView.image = UIImage(named: model)
        posterImageView.contentMode = .scaleAspectFill
        
    }

}
