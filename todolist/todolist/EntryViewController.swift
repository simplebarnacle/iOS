//
//  EntryViewController.swift
//  todolist
//
//  Created by jayden on 2023/04/15.
//

import UIKit

class EntryViewController: UIViewController {
    
    var update: (() -> Void)?

    @IBOutlet var field: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        field.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }

    @objc func saveTask() {
        guard let text = field.text, !text.isEmpty else { return }
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }
        
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
}

extension EntryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        return true
    }
}
