//
//  ViewController.swift
//  TodoList
//
//  Created by s ky on 2023/01/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapEditButton(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요!", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: {_ in
            
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        self.present(alert, animated: true, completion: nil )
    }
}

