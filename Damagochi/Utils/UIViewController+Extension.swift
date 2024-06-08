//
//  UIViewController+Extension.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

extension UIViewController {
    func setupNaviPrimary() {
        navigationController?.navigationBar.tintColor = .customFontColor
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .customBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.customFontColor]
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
}
