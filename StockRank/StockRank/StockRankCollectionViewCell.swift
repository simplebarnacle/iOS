//
//  StockRankCollectionViewCell.swift
//  StockRank
//
//  Created by s ky on 2023/02/01.
//

import UIKit

class StockRankCollectionViewCell: UICollectionViewCell {
    
    // uicomponent를 연결하자
    // uicomponent에 데이터를 업데이트 하는 코드를 넣자
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var companyIconImageView: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyPriceLabel: UILabel!
    @IBOutlet weak var diffLabel: UILabel!
    
    func configure(_ stock: StockModel) {
        rankLabel.text = "\(stock.rank)"
        companyIconImageView.image = UIImage(named: stock.imageName)
        companyNameLabel.text = stock.name
        companyPriceLabel.text = "\(convertToCurrencyFormat(price: stock.price)) 원"
        
        
        // 등락폭 색깔 방법1 (if문)
//        let color: UIColor
//        if stock.diff > 0 {
//            color = UIColor.systemRed
//        } else {
//            color = UIColor.systemBlue
//        }
        
        // 등락폭 색깔 방법2 (삼항연산자)
        diffLabel.textColor = stock.diff > 0 ? UIColor.systemRed : UIColor.systemBlue
        diffLabel.text = "\(stock.diff) %"
    }
    
    func convertToCurrencyFormat(price: Int) -> String {
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .decimal
        numberformatter.maximumFractionDigits = 0
        let result =  numberformatter.string(from: NSNumber(value: price)) ?? ""
        return result
    }
    
}
