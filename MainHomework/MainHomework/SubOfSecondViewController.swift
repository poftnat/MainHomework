//
//  SubOfSecondViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 12.11.2023.
//

import UIKit
    
class SubOfSecondViewController: UIViewController {
    
    weak var colorDelegate: ChangeColorDelegate?
    
    var textColor = ""
    
    @IBOutlet weak var colorTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTextLabel.text = textColor
    }
    
    @IBAction func changeToGreen(_ sender: Any) {
        colorDelegate?.newColorForLabel(color: "Выбран зеленый")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func changeToBlue(_ sender: Any) {
        colorDelegate?.newColorForLabel(color: "Выбран синий")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeToRed(_ sender: Any) {
        colorDelegate?.newColorForLabel(color: "Выбран красный")
        self.dismiss(animated: true, completion: nil)
    }
}

