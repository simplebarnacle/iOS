//
//  StationDetailViewController.swift
//  Subway
//
//  Created by jayden on 2023/03/28.
//

import SnapKit
import UIKit
import Alamofire

final class StationDetailViewController: UIViewController {
    
    private var realtimeArrivalList: [StationArrivalDataResponseModel.RealTimeArrival] = []
    
    private let station: Station
    
    private lazy var RefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        return refreshControl
        
    }()
    
    
     
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
    
    init(station: Station) {
        self.station = station
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = station.stationName
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ $0.edges.equalToSuperview() }
        
        fetchData()
    }
    
    @objc private func fetchData() {
        
        let stationName = station.stationName
        let Constant = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/"
        let url = Constant + "\(stationName.replacingOccurrences(of: "역", with: ""))"
        
        AF
            .request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" )
            .responseDecodable(of: StationArrivalDataResponseModel.self) {[weak self] response in
                self?.RefreshControl.endRefreshing()
                print(">>>>>>>>>>>>>>>>>>>>>>>>REFRESH")

                guard case .success(let data) = response.result else { return  }
                
                self?.realtimeArrivalList = data.realtimeArrivalList
                self?.collectionView.reloadData()
            }
            .resume()
    }
}

extension StationDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realtimeArrivalList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StationDetailCollectionViewCell", for: indexPath) as? StationDetailCollectionViewCell else { return UICollectionViewCell() }
        let realTimeArrival = realtimeArrivalList[indexPath.row]
        cell.setup(with: realTimeArrival)
        return cell
    }
}

