//
//  HomeCollectionViewCell.swift
//  pokemon-ajaib
//
//  Created by Hansel Matthew on 20/03/23.
//

import UIKit
import SDWebImage
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    private let cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    func setupView(card: Cards){
        cellImage.sd_setImage(with: URL(string: card.images?.large))
        
        contentView.addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    func setupBroken() {
        cellImage.image = UIImage(named: "img-broken-image")
        
        contentView.addSubview(cellImage)
        cellImage.snp.makeConstraints { make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
}

