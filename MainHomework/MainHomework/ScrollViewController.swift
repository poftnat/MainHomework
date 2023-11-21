//
//  ScrollViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 21.11.2023.
//

import UIKit

final class ScrollViewController: UIViewController {

   private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 230)
    
   private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.bounces = true
        scrollView.autoresizingMask = .flexibleWidth
        scrollView.contentSize = contentViewSize
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
   private lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.frame.size = contentViewSize
        return containerView
    }()
    
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "burgerImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor

        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Бургерная Джо"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.backgroundColor = .white
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        return label
    }()
    
    private lazy var kitchenTypeLabel: UILabel = {
        let label = UILabel()
        label.text = "Американская кухня"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var personalSaleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваша скидка 20%"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    private lazy var starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "5,0"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Что нужно для того, чтобы приготовить вкусные бургеры? Сперва, это качественные ингредиенты"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .natural
        return label
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Меню", for: .normal)
        button.setTitleColor(UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mapImage")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var depositeWarningLabel: UILabel = {
        let label = UILabel()
        label.text = "Депозит составляет 100Р. При отмене брони менее чем за 2 часа депозит удерживается"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var makeBookingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Создать событие", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var takeAwayButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать на вынос", for: .normal)
        button.setTitleColor(UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(red: 0.25, green: 0.69, blue: 0.29, alpha: 1.00).cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
   private func setupUI() {
        self.view.addSubview(scrollView)
        self.view.addSubview(backgroundImage)
        self.scrollView.addSubview(containerView)
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 4
        [backgroundImage, nameLabel, kitchenTypeLabel, personalSaleLabel, starImageView, ratingLabel, descriptionLabel, menuButton, mapImageView, depositeWarningLabel, makeBookingButton, takeAwayButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview($0)
        }
 
    }
    override func viewDidLayoutSubviews() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        backgroundImage.topAnchor.constraint(equalTo: containerView.topAnchor),
        backgroundImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        backgroundImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        backgroundImage.widthAnchor.constraint(equalTo: containerView.widthAnchor),
        backgroundImage.heightAnchor.constraint(equalToConstant: 210),
        
        nameLabel.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: -10),
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        nameLabel.heightAnchor.constraint(equalToConstant: 70),
        
        kitchenTypeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: -10),
        kitchenTypeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
        kitchenTypeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        kitchenTypeLabel.heightAnchor.constraint(equalToConstant: 20),
        
        personalSaleLabel.topAnchor.constraint(equalTo: kitchenTypeLabel.bottomAnchor, constant: 10),
        personalSaleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        personalSaleLabel.trailingAnchor.constraint(equalTo: starImageView.leadingAnchor),
        personalSaleLabel.heightAnchor.constraint(equalToConstant: 30),
        
        starImageView.topAnchor.constraint(equalTo: kitchenTypeLabel.bottomAnchor, constant: 10),
        starImageView.leadingAnchor.constraint(equalTo: personalSaleLabel.trailingAnchor),
        starImageView.trailingAnchor.constraint(equalTo: ratingLabel.leadingAnchor),
        starImageView.widthAnchor.constraint(equalToConstant: 30),
        starImageView.heightAnchor.constraint(equalToConstant: 30),

        ratingLabel.topAnchor.constraint(equalTo: kitchenTypeLabel.bottomAnchor, constant: 10),
        ratingLabel.leadingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -60),
        ratingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ratingLabel.heightAnchor.constraint(equalToConstant: 30),
        
        descriptionLabel.topAnchor.constraint(equalTo: personalSaleLabel.bottomAnchor, constant: 20),
        descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        
        menuButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
        menuButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        menuButton.widthAnchor.constraint(equalToConstant: 250),
        menuButton.heightAnchor.constraint(equalToConstant: 50),
        
        mapImageView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 30),
        mapImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
        mapImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        mapImageView.heightAnchor.constraint(equalToConstant: 200),
        
        depositeWarningLabel.topAnchor.constraint(equalTo: mapImageView.bottomAnchor, constant: 20),
        depositeWarningLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
        depositeWarningLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
        
        makeBookingButton.topAnchor.constraint(equalTo: depositeWarningLabel.bottomAnchor, constant: 20),
        makeBookingButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        makeBookingButton.leadingAnchor.constraint(equalTo: mapImageView.leadingAnchor),
        makeBookingButton.trailingAnchor.constraint(equalTo: mapImageView.trailingAnchor),
        makeBookingButton.heightAnchor.constraint(equalTo: menuButton.heightAnchor),
        
        
        takeAwayButton.topAnchor.constraint(equalTo: makeBookingButton.bottomAnchor, constant: 10),
        takeAwayButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        takeAwayButton.leadingAnchor.constraint(equalTo: mapImageView.leadingAnchor),
        takeAwayButton.trailingAnchor.constraint(equalTo: mapImageView.trailingAnchor),
        takeAwayButton.heightAnchor.constraint(equalTo: makeBookingButton.heightAnchor)
        
        ])
        
    }

}
