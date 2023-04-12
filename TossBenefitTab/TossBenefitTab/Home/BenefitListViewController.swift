//
//  BenefitListViewController.swift
//  TossBenefitTab
//
//  Created by jayden on 2023/04/12.
//

import UIKit

class BenefitListViewController: UIViewController {
    // 세 가지 형태
    // 포인트, 오늘의 혜택, 나머지 혜택
    
    // 유저가 포인트 셀을 눌렀을 때, 포인트 상세뷰 화면으로 이동
    // 유저가 혜택관련 셀을 눌렀을 때, 혜택 상세뷰 화면으로 이동
    
    // 사용자 관점에서 유저 스토리를 미리 정의해둘 필요가 있음.
    // 막무가내로 개발하는 것은 방향을 잃어버리기 쉬움
    // 기획 디자인 >> 설계
    @IBOutlet weak var collectionView: UICollectionView!
    
    typealias Item = AnyHashable
    enum Section {
        case today
        case other
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    var todaySectionItems: [AnyHashable] = []
    var otherSectionItems: [AnyHashable] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "혜택"

    }
    

}
