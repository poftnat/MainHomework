//
//  SecondViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 12.11.2023.
//

import UIKit

protocol ChangeColorDelegate: AnyObject{
    func newColorForLabel(color: String)
}

class SecondViewController: UIViewController{

    @IBOutlet weak var currentColorTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentColorTextLabel.text = "Выбран зеленый"
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "toSubSecondVC")
        as! SubOfSecondViewController
        vc.colorDelegate = self
        if let newTextLabel = currentColorTextLabel.text {
            vc.textColor = newTextLabel
        } else {
            return
        }
        show(vc, sender: nil)
    }
}
extension SecondViewController: ChangeColorDelegate {
    func newColorForLabel(color: String) {
        currentColorTextLabel.text = color
    }
}

