//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by s ky on 2023/02/07.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
    
}
