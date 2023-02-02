//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by s ky on 2023/02/02.
//

import UIKit

class FrameworkListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // data, presentaion, layout 정의하기
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navigationController?.navigationBar.topItem?.title = "🌞 Apple Frameworks"
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.estimatedItemSize = .zero
        }
        
        // contentInset으로 좌우여백주기
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16)
    }
}

extension FrameworkListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
}

extension FrameworkListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 3열일때
        let interItemSpacing: CGFloat = 10
        let padding: CGFloat = 16

        let width = (collectionView.bounds.width - interItemSpacing * 2 - padding * 2 ) / 3
        let height = width * 1.5
        
        // 2열일때
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - interItemSpacing * 1 - padding * 2 ) / 2
//        let height = width * 1.5

        // 4열일때
        
//        let interItemSpacing: CGFloat = 10
//        let padding: CGFloat = 16
//
//        let width = (collectionView.bounds.width - interItemSpacing * 3 - padding * 2 ) / 4
//        let height = width * 1.5
        
        
        
        return CGSize(width: width, height: height)
    }
    
    // item간 간격을 조정하는 메소드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // 라인 간격을 조정하는 메소드
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension FrameworkListViewController: UICollectionViewDelegate {
    
    // item 선택시 didSelectItemAt 메소드가 호출
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let framework = list[indexPath.item]
        print(">>>>> selected: \(framework.name)")
        
    }
}
