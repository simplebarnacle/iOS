//
//  StockRankViewController.swift
//  StockRank
//
//  Created by s ky on 2023/02/01.
//

import UIKit

class StockRankViewController: UIViewController {

    let stockList: [StockModel] = StockModel.list
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 리스트 및 그리드 그리는 연습중
    // UICollectionView로 그리는 것을 배우는 중
    // 필요한 정보들
    // data, presentation, layout
    // 어떤 데이터? -> stockList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 어떤 데이터? 그리고 어떻게 표현할 것인지? (data, presentation)
        collectionView.dataSource = self
        
        // 데이터를 어떻게 배치(layout)할것인지? (layout)
        collectionView.delegate = self
        
        
        // protocol? 일종의 약속들의 모음, 알려줄 대상을 정해야 하는데 위의 코드에서는 self 즉, viewcontroller 자신이다.
    }
}
  

extension StockRankViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stockList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 재사용가능한 cell을 가지고 오겠다. 구분자 , 순서
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StockRankCollectionViewCell", for: indexPath)
        return cell 
        
        
//        return UICollectionViewCell()
    }
}

extension StockRankViewController: UICollectionViewDelegateFlowLayout {
    
}
