//
//  ViewController.swift
//  MyAlbum
//
//  Created by jayden on 2023/03/11.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    @IBAction func showAlert(_ sender: Any) {
        print("refresh button tapped")
        
        
        
        let message = "가격은 ₩\(currentValue)원 입니다."
        
        let alert = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.refresh()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // 중복되는 코드 -> 기술부채 발생 -> 메서드로 해결
    // 메서드 하나에 한 가지 기능만 있는 것을 권장
    func refresh() {
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        PriceLabel.text = "₩\(currentValue)원 입니다...!"
    }
    
}

