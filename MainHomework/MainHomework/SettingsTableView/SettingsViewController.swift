//
//  SettingsViewController.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 20.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settings = SettingSource.makeSettingsInGroups()
    
    let tableView: UITableView = .init(frame: .zero, style: .insetGrouped) // создан тейблвью с параметрами рамки
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 50 //высота строки
        tableView.estimatedRowHeight = 100 //предполагаемая высота строки
        tableView.separatorStyle = .singleLine // стиль линии-сепаратора между строками
        tableView.separatorColor = .lightGray
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else { return UITableViewCell() }
        cell.configure(settings: settings[indexPath.section][indexPath.row])
        cell.accessoryType = .disclosureIndicator
            return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ac = UIAlertController(
            title: settings[indexPath.section][indexPath.row].settingName,
            message: settings[indexPath.section][indexPath.row].settingName,
            preferredStyle: .alert
            )
        ac.addAction(.init(title: "ok", style: .default, handler: nil))
        present(ac, animated: true)
    }
}

extension SettingsViewController { // добавляет таблицу на вью и устанавливает ее положение
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}


