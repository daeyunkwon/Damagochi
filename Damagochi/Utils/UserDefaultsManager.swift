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
            if let savedData = UserDefaults.standard.object(forKey: "damagochi") as? Data {
                if let loadedDamagochi = try? JSONDecoder().decode(Damagochi.self, from: savedData) {
                    return loadedDamagochi
                }
            }
            return nil
        }
        set {
            let encodedData = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(encodedData, forKey: "damagochi")
        }
    }
    
    static func removeData() {
        UserDefaults.standard.removeObject(forKey: "damagochi")
    }
}

