//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by s ky on 2023/02/03.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!

    override func prepareForReuse() {
        thumbnailImageView.image = nil
    }

    func configure(_ imageName: String) {
        thumbnailImageView.image = UIImage(named: imageName)
    }
    
}
