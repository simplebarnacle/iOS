//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by s ky on 2023/02/02.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        // 폰트사이즈를 화면에 맞게 자동조정
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    // Cell을 업데이트 할 수 있는 메소드를 추가
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
