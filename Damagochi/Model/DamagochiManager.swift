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
        guard let damagochi = self.damagochi else {return}
        UserDefaultsManager.damagochi = damagochi
        isDataAvailable = true
    }
    
    private func updateLevel() {
        guard let damagochi = self.damagochi else {return}
        
        let eat = Double(damagochi.eat) / 5
        let drink = Double(damagochi.drink) / 2
        
        if eat != 0 && drink != 0 {
            let result = Int(eat / drink)
            
            if result != 0 {
                self.damagochi?.level = result
            }
        }
    }
    
    func updateEat(numberOfEat: Int) {
        self.damagochi?.eat += numberOfEat
        updateLevel()
    }
    
    func updateDrink(numberOfDrink: Int) {
        self.damagochi?.drink += numberOfDrink
        updateLevel()
    }
    
    func updateUsername(name: String) {
        self.damagochi?.userName = name
    }
    
    func changeKind(kind: Kind) {
        self.damagochi?.kind = kind
    }
    
    func updateCommentType(type: CommentType) {
        self.damagochi?.commentType = type
    }
    
    func deleteData(completion: @escaping () -> Void) {
        UserDefaultsManager.removeData()
        self.damagochi = nil
        setup()
        completion()
    }
}
