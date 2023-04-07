//
//  StationSearchViewController.swift
//  Subway
//
//  Created by jayden on 2023/04/07.
//

import UIKit
import SnapKit

class StationSearchViewController: UIViewController {
    
    private var numberOfCell: Int = 0
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isHidden = true
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemBackground

        setNavigationItems()
        setTableViewLayout()
        
    }
    
    private func setNavigationItems() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "지하철 도착정보😄"
        
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "지하철 정보를 입력해주세요."
        // searchController 탭 했을때, 배경을 희미하게 할지 여부
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        // 서치바가 항상 보이게 하고 싶었던 갱석이
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func setTableViewLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ $0.edges.equalToSuperview() }
    }

}

extension StationSearchViewController: UISearchBarDelegate {
    // 서치바가 탭 되었을 때, 입력이 시작되는 타이밍 >>> 테이블 뷰 보이기
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        numberOfCell = 10
        tableView.reloadData()
        tableView.isHidden = false
    }
    // 입력이 끝나면 >>> 테이블 뷰 사라짐
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        numberOfCell = 0
        tableView.isHidden = true
    }
}

extension StationSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 이번에는 따로 cell을 커스텀하지 않고 순정으로..!
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.item)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }
    
}

extension StationSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StationDetailViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
