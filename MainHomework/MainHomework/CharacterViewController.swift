//
//  CharacterViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 24.11.2023.
//

import UIKit

final class CharacterViewController: UIViewController {
    
    private var hero: Hero
    
    init(hero: Hero) {
        self.hero = hero
        super.init(nibName: nil, bundle: nil)
    }
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var statusIndicatorView: UIView = {
        let indicator = UIView()
        indicator.backgroundColor = .white
        indicator.layer.cornerRadius = 5
        indicator.clipsToBounds = true
        return indicator
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        return label
    }()
    
    private lazy var commonStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Live status:"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var commonSpeciesGenderLabel: UILabel = {
        let label = UILabel()
        label.text = "Species and gender"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var speciesGenderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var commonLocationLabel: UILabel = {
        let label = UILabel()
        label.text = "Last known location"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private lazy var commonFirstSeenAtLabel: UILabel = {
        let label = UILabel()
        label.text = "First seen at:"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var firstSeenAtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.18, green: 0.17, blue: 0.15, alpha: 1.00)
        setupUI()
        addValues()
        setupConstraints()
    }
    
    private func setupUI() {
        [characterImageView, nameLabel, commonStatusLabel, statusIndicatorView, statusLabel, commonSpeciesGenderLabel, speciesGenderLabel, commonLocationLabel, locationLabel, commonFirstSeenAtLabel, firstSeenAtLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func addValues() {
        guard let imageURL = URL(string: hero.image ?? " ") else { return }
        characterImageView.load(url: imageURL)
        nameLabel.text = hero.name
        statusLabel.text = hero.status?.rawValue
        
        guard let species = hero.species else { return }
        guard let gender = hero.gender else { return }
        speciesGenderLabel.text = "\(species.rawValue.capitalized)(\(gender.rawValue.capitalized))"
        locationLabel.text = hero.location?.name
        firstSeenAtLabel.text = hero.episode![0]
        
        switch hero.status {
        case .alive :
            statusIndicatorView.backgroundColor = .green
        case .dead :
            statusIndicatorView.backgroundColor = .red
        case .unknown :
            statusIndicatorView.backgroundColor = .yellow
        case .none :
            statusIndicatorView.backgroundColor = .clear
        }
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            characterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            characterImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            
            nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            commonStatusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16),
            commonStatusLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            commonStatusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            statusIndicatorView.topAnchor.constraint(equalTo: commonStatusLabel.bottomAnchor, constant: 10),
            statusIndicatorView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            statusIndicatorView.heightAnchor.constraint(equalToConstant: 8),
            statusIndicatorView.widthAnchor.constraint(equalTo: statusIndicatorView.heightAnchor),
            
            statusLabel.topAnchor.constraint(equalTo: commonStatusLabel.bottomAnchor, constant: 4),
            statusLabel.leadingAnchor.constraint(equalTo: statusIndicatorView.trailingAnchor, constant: 8),
            statusLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            commonSpeciesGenderLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            commonSpeciesGenderLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            commonSpeciesGenderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            speciesGenderLabel.topAnchor.constraint(equalTo: commonSpeciesGenderLabel.bottomAnchor, constant: 4),
            speciesGenderLabel.leadingAnchor.constraint(equalTo: commonSpeciesGenderLabel.leadingAnchor),
            
            commonLocationLabel.topAnchor.constraint(equalTo: speciesGenderLabel.bottomAnchor, constant: 16),
            commonLocationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: commonLocationLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            commonFirstSeenAtLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 16),
            commonFirstSeenAtLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            firstSeenAtLabel.topAnchor.constraint(equalTo: commonFirstSeenAtLabel.bottomAnchor, constant: 4),
            firstSeenAtLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
}
