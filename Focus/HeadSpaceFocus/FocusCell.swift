//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by s ky on 2023/02/05.
//

import UIKit

class FocusCell: UICollectionViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    // cell이 스토리보드에서 깨어났을 때?
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        imageLabel.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal) // 랜더링 모드를 변경
    }
    
    
    
}
