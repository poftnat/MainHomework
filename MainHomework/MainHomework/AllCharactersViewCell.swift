//
//  AllCharactersViewCell.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 23.11.2023.
//

import UIKit

class AllCharactersViewCell: UICollectionViewCell {
    
    let characterImageView = UIImageView()
//    =  {
//        let imageView = UIImageView()
//        return imageView
//    }()
//
    private let nameLabel = UILabel()
//        let label = UILabel()
//        return label
//    }()
//    
    private let statusLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let episodeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private func setupCell() {
        [characterImageView, nameLabel, statusLabel, speciesLabel, typeLabel, locationLabel, episodeLabel].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        self.clipsToBounds = true
        self.backgroundColor = .green
        self.layer.cornerRadius = 8
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImageView.heightAnchor.constraint(equalToConstant: 80),
            characterImageView.widthAnchor.constraint(equalToConstant: 80),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configure(result: Hero) {
        
        setupCell()
        
        guard let imageURL = URL(string: result.image ?? " ") else { return }
        characterImageView.load(url: imageURL)
        
        nameLabel.text = result.name
        statusLabel.text = result.status?.rawValue
        speciesLabel.text = result.species?.rawValue
        typeLabel.text = result.type
//        locationLabel.text = result.location
//        episodeLabel.text = result.episode

    }
    
}
