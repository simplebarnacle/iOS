//
//  ViewController.swift
//  ChatAI
//
//  Created by jayden on 2023/03/29.
//

import UIKit

class ViewController: UIViewController {
    
    private let field: UITextField = {
       let textField = UITextField()
        textField.placeholder = "입력하세요!"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .green
        textField.layer.cornerRadius = 5
        textField.returnKeyType = .done
        return textField
    }()
    
    private var models = [String]()
    
    private let tableView: UITableView = {
       let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        field.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(field)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            field.heightAnchor.constraint(equalToConstant: 50),
            field.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            field.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            field.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: field.topAnchor)
            
        ])
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            models.append(text)
            APICaller.shared.getResponse(input: text) {[weak self] result in
                switch result {
                case .success(let output):
                    self?.models.append(output)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        self?.field.text = nil
                    }
                case .failure(let error):
                    error.localizedDescription
                }
            }
        }
        return true
    }
}
