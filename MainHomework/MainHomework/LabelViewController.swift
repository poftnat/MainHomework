//
//  LabelViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 16.11.2023.
//

import UIKit

class LabelViewController: UIViewController {

    @IBOutlet weak var leftTextLabel: UILabel!
    
    @IBOutlet weak var rightTextLabel: UILabel!
    
    @IBOutlet weak var leftLabelTextField: UITextField!
    
    @IBOutlet weak var rightLabelTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTextLabel.text = "     "
        rightTextLabel.text = "     "

    }
    
    @IBAction func compareLines(_ sender: Any) {
        leftTextLabel.text = leftLabelTextField.text
        rightTextLabel.text = rightLabelTextField.text
    }
    
}
