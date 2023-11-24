//
//  UIImageView + extension.swift
//  MainHomework
//
//  Created by Наталья Владимировна Пофтальная on 23.11.2023.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
