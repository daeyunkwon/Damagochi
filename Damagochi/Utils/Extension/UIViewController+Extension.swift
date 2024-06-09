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
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "알겠어요", style: .default))
        present(alert, animated: true)
    }
}
