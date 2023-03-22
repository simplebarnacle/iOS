//
//  TodayCollectionHeaderView.swift
//  AppStore
//
//  Created by jayden on 2023/03/22.
//

import UIKit
import SnapKit

final class TodayCollectionHeaderView: UICollectionReusableView {
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "3월 22일 수요일"
        label.font = .systemFont(ofSize: 14, weight: .black)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "투데이"
        label.font = .systemFont(ofSize: 36, weight: .black)
        label.textColor = .label
        
        return label
    }()
    
    func setupViews() {
        [dateLabel, titleLabel].forEach { addSubview($0) }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        }
    }
}
