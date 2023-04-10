//
//  PriorityCollectionViewCell.swift
//  NotToDo_Priority
//
//  Created by jayden on 2023/04/10.
//

import UIKit

class PriorityCollectionViewCell: UICollectionViewCell {
    
    private lazy var remainTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
}
