//
//  QuickFocusDetailViewController.swift
//  HeadSpaceFocus
//
//  Created by jayden on 2023/04/04.
//

import UIKit

class QuickFocusDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var quickFocus: QuickFocus = QuickFocus(title: "Unknown", description: "", imageName: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    func setup() {
        titleLabel.text = quickFocus.title
        descriptionLabel.text = quickFocus.description
        imageView.image = UIImage(named: quickFocus.imageName)
    }

}
