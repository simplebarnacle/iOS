//
//  QuickFocusListViewController.swift
//  HeadSpaceFocus
//
//  Created by jayden on 2023/04/04.
//

import UIKit

class QuickFocusListViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let allQuickFocus = QuickFocus.breathing + QuickFocus.walking
    
    let breathingList = QuickFocus.breathing
    let walkingList = QuickFocus.walking
    
    // CaseIterable 프로토콜을 사용하면 Section.allCases는 let allItems: [Setcion] = [.breathe, .walking]과 동일
    // Section.allCases
    enum Section: CaseIterable {
        case breathe
        case walking
        
        var title: String {
            switch self {
            case .breathe: return "Breathing exercises"
            case .walking: return "Mindful walks"
            }
        }
    }
    
    typealias Item = QuickFocus
    var dataSourcec: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        // presentation
        dataSourcec = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuickFocusCell", for: indexPath) as? QuickFocusCell else { return nil}
            cell.configure(item)
            return cell
        })
        
        // header 추가
        dataSourcec.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "QuickFocusHeaderView", for: indexPath) as? QuickFocusHeaderView else { return nil }
            let allSections = Section.allCases
            let section = allSections[indexPath.section]
            header.configure(section.title)
            return header
            
        }
        
        // data
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        //        snapshot.appendSections(Section.allCases)
        snapshot.appendSections([.breathe, .walking])
        snapshot.appendItems(breathingList, toSection: .breathe)
        snapshot.appendItems(walkingList, toSection: .walking)
        dataSourcec.apply(snapshot)
        // layout
        collectionView.collectionViewLayout = layout()
        
    }
    
    private func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(5)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 0)
        section.interGroupSpacing = 5
//        section.orthogonalScrollingBehavior = .continuous
        
        // header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    
    
}

extension QuickFocusListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let breathinglist = breathingList[indexPath.item]
//        let walkinglist = walkingList[indexPath.item]
        let all = allQuickFocus[indexPath.item]
//        print(">>> Tapped \(breathinglist.title)")
//        print(">>> Tapped \(walkinglist.title)")
        print(">>> Tapped \(all.title)")
        
        let storyboard = UIStoryboard(name: "QuickFocusDetail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "QuickFocusDetailViewController") as! QuickFocusDetailViewController
        vc.quickFocus = all
        present(vc, animated: true)
    }
}
