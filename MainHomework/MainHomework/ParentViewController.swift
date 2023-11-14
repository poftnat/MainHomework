//
//  ParentViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 13.11.2023.


protocol ChangeMasterDelegate: AnyObject {
    func changeMasterColor(color: UIColor)
}

import UIKit

class ParentViewController: UIViewController {
    
    var childViewControllerOne: ChildViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let toChildController = segue.destination as? ChildViewController, segue.identifier == "childController" {
            toChildController.delegate = self
            childViewControllerOne = toChildController
        }
    }
    
    @IBAction func changeChildToGreen(_ sender: Any) {
        childViewControllerOne?.view.backgroundColor = .green
    }
    
    @IBAction func changeChildToYellow(_ sender: Any) {
        childViewControllerOne?.view.backgroundColor = .yellow
    }
    
    @IBAction func changeChildToPurple(_ sender: Any) {
        childViewControllerOne?.view.backgroundColor = .purple
    }
    
}
extension ParentViewController: ChangeMasterDelegate {
    func changeMasterColor(color: UIColor) {
        view.backgroundColor = color
    }
}
