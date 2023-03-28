//
//  StationDetailViewController.swift
//  Subway
//
//  Created by jayden on 2023/03/28.
//

import SnapKit
import UIKit

final class StationDetailViewController: UIViewController {
    
    private lazy var RefreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        return refreshControl
        
    }()
    
    @objc func fetchData() {
        print(">>>> REFRESH !!!!!!!!")
        RefreshControl.endRefreshing()
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: view.frame.width - 32, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(StationDetailCollectionViewCell.self, forCellWithReuseIdentifier: "StationDetailCollectionViewCell")
        collectionView.dataSource = self
        
        collectionView.refreshControl = RefreshControl
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "수원역"
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalToSuperview() }
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectionViewCell", for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setup()
        return cell
    }
}

