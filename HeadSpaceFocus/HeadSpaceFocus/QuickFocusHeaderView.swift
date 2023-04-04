//
//  QuickFocusHeaderView.swift
//  HeadSpaceFocus
//
//  Created by jayden on 2023/04/04.
//

import UIKit

class QuickFocusHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String) {
        titleLabel.text = title
    }
}
