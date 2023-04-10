//
//  PriorityViewController.swift
//  NotToDo_Priority
//
//  Created by jayden on 2023/04/10.
//

import UIKit

class PriorityViewController: UIViewController {
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         layout.estimatedItemSize = CGSize(width: 250,
                                           height: 100)
         layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
         layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView()
        collectionView.backgroundColor = .green
        collectionView.register(PriorityCollectionViewCell.self, forCellWithReuseIdentifier: "PriorityCollectionViewCell")

        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Priority"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        

    }

}


extension PriorityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PriorityCollectionViewCell", for: indexPath) as? PriorityCollectionViewCell else { return UICollectionViewCell()}
        
        return cell
        
    }
    
    
}
