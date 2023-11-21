//
//  SettingsSource.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 20.11.2023.
//

import Foundation
import UIKit

struct Settings {
    
    let settingName: String
    let image: String
    let group: Group
}

enum Group {
    case connection
    case screen
    case basic
}

struct SettingSource {
    static func makeSettings() -> [Settings] {[
        
        .init(settingName: "Авиарежим", image: "airplane", group: .connection),
        .init(settingName: "Wi-Fi", image: "wifi", group: .connection),
        .init(settingName: "Bluetooth", image: "sun.min", group: .connection),
        .init(settingName: "Сотовая связь", image: "highlighter", group: .connection),
        .init(settingName: "Режим модема", image: "lasso", group: .connection),
        .init(settingName: "Уведомления", image: "folder", group: .screen),
        .init(settingName: "Звуки, тактильные сигналы", image: "paperplane", group: .screen),
        .init(settingName: "Не беспокоить", image: "archivebox", group: .screen),
        .init(settingName: "Экранное время", image: "clipboard", group: .screen),
        .init(settingName: "Основные", image: "ladybug", group: .basic),
        .init(settingName: "Пункт управления", image: "hands.sparkles", group: .basic),
        .init(settingName: "Экран и яркость", image: "slider.horizontal.3", group: .basic)
    ]}
    
    static func makeSettingsInGroups() -> [[Settings]] {
        let connection = makeSettings().filter { $0.group == .connection }
        let screen = makeSettings().filter { $0.group == .screen }
        let basic = makeSettings().filter { $0.group == .basic }
        return [connection, screen, basic]
    }
}
