//
//  MainViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 20.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let toTaskOneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("К первому заданию", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.numberOfLines = 0
//        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.addTarget(self, action: #selector(toFirstTaskAction), for: .touchUpInside)
        return button
    }()
    let toTaskTwoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("Ко второму заданию", for: .normal)
        button.addTarget(self, action: #selector(toSecondTaskAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let toTaskThreeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.setTitle("К третьему заданию", for: .normal)
        button.addTarget(self, action: #selector(toThirdTaskAction), for: .touchUpInside)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(toTaskOneButton)
        view.addSubview(toTaskTwoButton)
        view.addSubview(toTaskThreeButton)
        
        toTaskOneButton.translatesAutoresizingMaskIntoConstraints = false
        toTaskTwoButton.translatesAutoresizingMaskIntoConstraints = false
        toTaskThreeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toTaskOneButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            toTaskOneButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            toTaskOneButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            toTaskOneButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            toTaskTwoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            toTaskTwoButton.leadingAnchor.constraint(equalTo: toTaskOneButton.leadingAnchor),
            toTaskTwoButton.trailingAnchor.constraint(equalTo: toTaskOneButton.trailingAnchor),
            toTaskTwoButton.topAnchor.constraint(equalTo: toTaskOneButton.bottomAnchor, constant: 30),

            toTaskThreeButton.topAnchor.constraint(equalTo: toTaskTwoButton.bottomAnchor, constant: 30),
            toTaskThreeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            toTaskThreeButton.trailingAnchor.constraint(equalTo: toTaskOneButton.trailingAnchor),
            toTaskThreeButton.leadingAnchor.constraint(equalTo: toTaskOneButton.leadingAnchor)
        ])
        
    }
    
    @objc func toFirstTaskAction() {
        let newVC = ShopViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
    @objc func toSecondTaskAction() {
        let newVC = SettingsViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
    @objc func toThirdTaskAction() {
        let newVC = ShopViewController()
        navigationController?.pushViewController(newVC, animated: true)
    }
}
