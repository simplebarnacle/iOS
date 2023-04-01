//
//  StockRankViewController.swift
//  StockRank
//
//  Created by jayden on 2023/04/01.
//

import UIKit

class StockRankViewController: UIViewController {
    
    // Data
    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Data, Presentation
        collectionView.dataSource = self
        // Layout
        collectionView.delegate = self
        
    }
    
    
    @IBAction func likeButton(_ sender: UIButton) {
        
        print(">>> liked")
        
        let alert = UIAlertController(title: "알림", message: "you liked 😍", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(defaultAction)
//        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension StockRankViewController: UICollectionViewDataSource {
    
    // 한 섹션에 몇개의 아이템을 표현?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    // Cell을 어떻게 표현?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용 가능한 셀을 가지고옴.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath) as? StockRankCollectionViewCell else { return UICollectionViewCell() }
        let stock = stockList[indexPath.item]
        cell.configure(stock)
        
        
        
        return cell
    }
    
}

// 셀을 어떻게 배치할 것인지
extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    
    // 셀 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // width == collectionView.width
        // height = 80
        
        return CGSize(width: collectionView.bounds.width, height: 80)
    }
    
}
