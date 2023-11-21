//
//  ShopCollectionViewCell.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 19.11.2023.
//

import UIKit

final class ShopCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        return imageView
    }()
    
    private lazy var recentPriceLabel: UILabel = {
        let price = UILabel()
        price.contentMode = .left
        price.font = UIFont.systemFont(ofSize: 16)
        price.textColor = .darkGray
        return price
    }()
    
    private lazy var currentPriceLabel: UILabel = {
        let price = UILabel()
        price.contentMode = .left
        price.font = UIFont.boldSystemFont(ofSize: 20)
        price.textColor = .red
        return price
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let description = UILabel()
        description.contentMode = .bottomLeft
        description.font = UIFont.systemFont(ofSize: 16)
        description.textColor = .lightGray
        return description
    }()
    
    private lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.backgroundColor = .red
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        return label
    }()
    
    private func setup() {
        contentView.addSubview(imageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(recentPriceLabel)
        contentView.addSubview(currentPriceLabel)
        contentView.addSubview(discountLabel)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        recentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        currentPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        discountLabel.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70),
            
            
            recentPriceLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 1),
            recentPriceLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            recentPriceLabel.trailingAnchor.constraint(equalTo: discountLabel.leadingAnchor),
            recentPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            currentPriceLabel.topAnchor.constraint(equalTo: recentPriceLabel.bottomAnchor),
            currentPriceLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            currentPriceLabel.widthAnchor.constraint(equalTo: recentPriceLabel.widthAnchor),
            currentPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            discountLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 1),
            discountLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            discountLabel.widthAnchor.constraint(equalToConstant: 40),
            discountLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor)
        ])
    }
    
    func configure(source: Source) {
        imageView.image = UIImage.init(named: source.image)
        recentPriceLabel.text = source.recentPrice
        currentPriceLabel.text = source.currentPrice
        descriptionLabel.text = source.description
        discountLabel.text = source.saleLabel
        setup()
    }
}
