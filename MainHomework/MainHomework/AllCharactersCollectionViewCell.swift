//
//  AllCharactersViewCell.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 23.11.2023.
//

import UIKit

final class AllCharactersCollectionViewCell: UICollectionViewCell {
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var colorIndicatorView: UIView = {
        let indicator = UIView()
        indicator.backgroundColor = .white
        indicator.layer.cornerRadius = 5
        indicator.clipsToBounds = true
        return indicator
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    private lazy var commonLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Last known location:"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private func setupCell() {
        [characterImageView, nameLabel, statusLabel, typeLabel, colorIndicatorView, commonLocationLabel, locationLabel].forEach{
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.clipsToBounds = true
        self.backgroundColor = UIColor(red: 0.259, green: 0.259, blue: 0.259, alpha: 1.00)
        self.layer.cornerRadius = 5
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            characterImageView.widthAnchor.constraint(equalTo: contentView.heightAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            colorIndicatorView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 17),
            colorIndicatorView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            colorIndicatorView.heightAnchor.constraint(equalToConstant: 8),
            colorIndicatorView.widthAnchor.constraint(equalTo: colorIndicatorView.heightAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            statusLabel.leadingAnchor.constraint(equalTo: colorIndicatorView.trailingAnchor, constant: 8),
            statusLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            statusLabel.centerYAnchor.constraint(equalTo: colorIndicatorView.centerYAnchor),
            
            typeLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 4),
            typeLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            typeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            commonLocationLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 4),
            commonLocationLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            commonLocationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            locationLabel.topAnchor.constraint(equalTo: commonLocationLabel.bottomAnchor, constant: 2),
            locationLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 8),
            locationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure(result: Hero) {
        setupCell()
        setupConstraints()
        
        guard let imageURL = URL(string: result.image ?? " ") else { return }
        characterImageView.load(url: imageURL)
        
        nameLabel.text = result.name
        statusLabel.text = "\(result.status?.rawValue ?? "  ") - \(result.species?.rawValue ?? "  ")"
        typeLabel.text = result.type
        locationLabel.text = "\(result.location?.name ?? "")"
        
        switch result.status {
        case .alive :
            colorIndicatorView.backgroundColor = .green
        case .dead :
            colorIndicatorView.backgroundColor = .red
        case .unknown :
            colorIndicatorView.backgroundColor = .yellow
        case .none:
            colorIndicatorView.backgroundColor = .clear
        }
    }
}
