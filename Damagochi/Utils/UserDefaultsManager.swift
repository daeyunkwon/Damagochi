//
//  UserDefaultsManager.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

struct UserDefaultsManager {
    static var damagochi: Damagochi? {
        get {
            return UserDefaults.standard.object(forKey: "damagochi") as? Damagochi
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "damagochi")
        }
    }
}
