//
//  ChatListViewController.swift
//  ChatList
//
//  Created by s ky on 2023/02/02.
//

import UIKit

class ChatListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList: [Chat] = Chat.list
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // data, presentation, layout
        
        // data & presentation을 담당
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // sorted 내장함수를 통해 날짜를 내림차순으로 설정
        chatList = chatList.sorted(by: { chat1, chat2 in
            return chat1.date > chat2.date
        })
        
    }
}

extension ChatListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else {
            return UICollectionViewCell()
        }
                
        let chat = chatList[indexPath.item]
        cell.configure(chat )
        return cell
    }
}

extension ChatListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
}
