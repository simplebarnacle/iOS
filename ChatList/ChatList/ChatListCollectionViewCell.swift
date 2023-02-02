//
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by s ky on 2023/02/02.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbnail.layer.cornerRadius = 10
    }
    
    
    // 메소드 구성
    func configure(_ chat: Chat) {
        thumbnail.image =  UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDataString(dateString: chat.date)
    }
    
    // 날짜 형식을 변환하기 위한 함수생성
    // String -> Date -> String
    // 2022-03-02 -> 3/11
    func formattedDataString(dateString: String) -> String {
        
        let formatter = DateFormatter()
        
        // iOS dateformatter 검색
        formatter.dateFormat = "yyyy-MM-dd"
        
        // 문자열 -> date 타입으로
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else {
            return ""
        }
    }
    
}
