//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by jayden on 2023/04/01.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    
    // UIComponent 연결
    // UIcomponent에 데이터를 업데이트하는 코드
    
    @IBOutlet weak var ranklabel: UILabel!
    @IBOutlet weak var companyIconLabel: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    
    func configure(_ stock: StockModel) {
        ranklabel.text = "\(stock.rank)"
        companyIconLabel.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(converToCurrencyFormat(price: stock.price)) 원"
        
        // 가격 등락폭 색상을 설정 (삼항연산자)
        diffLabel.textColor = stock.diff > 0 ? UIColor.red : UIColor.blue
        diffLabel.text = "\(stock.diff) %"
    }
    
    func converToCurrencyFormat(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: price)) ?? ""
    }
    
}
