//
//  HomeViewController.swift
//  CarrotHomeTab
//
//  Created by s ky on 2023/01/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func ctaButtonTapped(_ sender: Any) {
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "D") as! DetailViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
