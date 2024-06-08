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
    
    private var damagochi: Damagochi? {
        didSet {
            save()
        }
    }
    
    var isDataAvailable: Bool = false
    
    func setup() {
        if let data = UserDefaultsManager.damagochi {
            self.isDataAvailable = false
            self.damagochi = data
        } else {
            self.isDataAvailable = false
        }
    }
    
    func create(kind: Kind) {
        self.damagochi = Damagochi(kind: kind)
    }
    
    func get() -> Damagochi? {
        return self.damagochi
    }
    
    private func save() {
        UserDefaultsManager.damagochi = self.damagochi
    }
    
    func updateLevel(completion: @escaping (UIImage?) -> Void) {
        guard let damagochi = self.damagochi else {return}
        
        let eat = Double(damagochi.eat) / 5
        let drink = Double(damagochi.drink) / 2
        
        let result = Int(eat / drink)
        self.damagochi?.level = result
        
        completion(self.damagochi?.form)
    }
    
    func updateEat(numberOfEat: Int, completion: @escaping (Int?) -> Void) {
        self.damagochi?.eat = numberOfEat
        completion(self.damagochi?.eat)
    }
    
    func updateDrink(numberOfDrink: Int, completion: @escaping (Int?) -> Void) {
        self.damagochi?.drink = numberOfDrink
        completion(self.damagochi?.drink)
    }
    
    func updateUsername(name: String) {
        self.damagochi?.userNmae = name
    }
    
    
    
    
    
    
    
    
}
