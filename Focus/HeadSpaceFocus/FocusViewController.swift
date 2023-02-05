//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by s ky on 2023/02/04.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    var curated: Bool = false
    
    var items: [Focus] = Focus.list
    
    
    typealias Item = Focus
    // 단일 Section 생성
    enum Section {
        case main
    }
    
    // Do not repeat yourself
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshButton.layer.cornerRadius = 10

       // CollectionView는  data, presentaion, layout를 정해줘야함
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else {
                return nil
            }
            
            cell.configure(item)
            return cell
        })
        
        // Data - Snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        
        // Layout, 개별적으로 함수를 생성
        collectionView.collectionViewLayout = layout()
        
        // button title 생성 -> 개별 메소드 생성
//        let title = curated ? "See All" : "See Recommendation"
//        refreshButton.setTitle(title, for: .normal)
        updateButtonTitle()
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    // 반복되는 코드는 하나의 메소드로 구성하여 관리하는 것이 좋음
    func updateButtonTitle() {
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
    
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        curated.toggle()
        
        self.items = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        updateButtonTitle()
    }
    
}
