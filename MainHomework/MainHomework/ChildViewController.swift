//
//  ChildViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 13.11.2023.
//

import UIKit

class ChildViewController: UIViewController {
    
    weak var delegate: ChangeMasterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeParentToGreen(_ sender: Any) {
        delegate?.changeMasterColor(color: .green)
    }
    
    @IBAction func changeParentToYellow(_ sender: Any) {
        delegate?.changeMasterColor(color: .yellow)
    }
    
    @IBAction func changeParentToPurple(_ sender: Any) {
        delegate?.changeMasterColor(color: .purple)
    }
    
    
    
}
