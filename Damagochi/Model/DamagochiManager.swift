//
//  DamagochiManager.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

final class DamagochiManager {
    
    static let shared = DamagochiManager()
    private init() {}
    
    private var damagochi: Damagochi = Damagochi(kind: .firstModel) {
        didSet {
            save()
        }
    }
    
    func create(kind: Kind) {
        self.damagochi = Damagochi(kind: kind)
    }
    
    func get() -> Damagochi {
        return self.damagochi
    }
    
    private func save() {
        UserDefaultsManager.damagochi = self.damagochi
    }
    
    func updateLevel(completion: @escaping (UIImage?) -> Void) {
        let eat = Double(self.damagochi.eat) / 5
        let drink = Double(self.damagochi.drink) / 2
        
        let result = Int(eat / drink)
        self.damagochi.level = result
        
        completion(self.damagochi.form)
    }
    
    func updateEat(numberOfEat: Int, completion: @escaping (Int) -> Void) {
        self.damagochi.eat = numberOfEat
        completion(self.damagochi.eat)
    }
    
    func updateDrink(numberOfDrink: Int, completion: @escaping (Int) -> Void) {
        self.damagochi.drink = numberOfDrink
        completion(self.damagochi.drink)
    }
    
    func updateUsername(name: String) {
        self.damagochi.userNmae = name
    }
    
    
    
    
    
    
    
    
}
