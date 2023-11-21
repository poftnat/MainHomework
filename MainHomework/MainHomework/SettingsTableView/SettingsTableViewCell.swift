//
//  SettingsTableViewCell.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 20.11.2023.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    private let settingPicture = UIImageView()
    
    private lazy var settingNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        [settingPicture, settingNameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            settingPicture.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            settingPicture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            settingPicture.heightAnchor.constraint(equalToConstant: 32),
            settingPicture.widthAnchor.constraint(equalToConstant: 32),
            
            settingNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            settingNameLabel.leadingAnchor.constraint(equalTo: settingPicture.trailingAnchor, constant: 8),
            settingNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            settingNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ])
    }
    
    func configure(settings: Settings) {
        settingPicture.image = UIImage(systemName: settings.image)
        settingNameLabel.text = settings.settingName
    }
    
}
