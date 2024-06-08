//
//  Damagochi.swift
//  Damagochi
//
//  Created by 권대윤 on 6/7/24.
//

import UIKit

enum Kind {
    case firstModel
    case secondModel
    case thirdModel
    case noneModel
}

struct Damagochi {
    var userNmae: String
    var level: Int
    var eat: Int
    var drink: Int
    var kind: Kind
    
    init(kind: Kind) {
        if let data = UserDefaultsManager.damagochi {
            self.userNmae = data.userNmae
            self.level = data.level
            self.eat = data.eat
            self.drink = data.drink
            self.kind = data.kind
        } else {
            self.userNmae = "대장"
            self.level = 0
            self.eat = 0
            self.drink = 0
            self.kind = kind
        }
    }
}

extension Damagochi {
    var form: UIImage? {
        switch level {
        case 1:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-1")
            case .secondModel:
                return UIImage(named: "2-1")
            case .thirdModel:
                return UIImage(named: "3-1")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 2:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-2")
            case .secondModel:
                return UIImage(named: "2-2")
            case .thirdModel:
                return UIImage(named: "3-2")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 3:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-3")
            case .secondModel:
                return UIImage(named: "2-3")
            case .thirdModel:
                return UIImage(named: "3-3")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 4:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-4")
            case .secondModel:
                return UIImage(named: "2-4")
            case .thirdModel:
                return UIImage(named: "3-4")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 5:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-5")
            case .secondModel:
                return UIImage(named: "2-5")
            case .thirdModel:
                return UIImage(named: "3-5")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 6:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-6")
            case .secondModel:
                return UIImage(named: "2-6")
            case .thirdModel:
                return UIImage(named: "3-6")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 7:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-7")
            case .secondModel:
                return UIImage(named: "2-7")
            case .thirdModel:
                return UIImage(named: "3-7")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 8:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-8")
            case .secondModel:
                return UIImage(named: "2-8")
            case .thirdModel:
                return UIImage(named: "3-8")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 9:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-9")
            case .secondModel:
                return UIImage(named: "2-9")
            case .thirdModel:
                return UIImage(named: "3-9")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        case 10:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-9")
            case .secondModel:
                return UIImage(named: "2-9")
            case .thirdModel:
                return UIImage(named: "3-9")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        default:
            switch kind {
            case .firstModel:
                return UIImage(named: "1-9")
            case .secondModel:
                return UIImage(named: "2-9")
            case .thirdModel:
                return UIImage(named: "3-9")
            case .noneModel:
                return UIImage(named: "noImage")
            }
        }
    }
}

extension Damagochi {
    var damagochiName: String {
        switch kind {
        case .firstModel:
            return "따끔따끔 다마고치"
        case .secondModel:
            return "방실방실 다마고치"
        case .thirdModel:
            return "반짝반짝 다마고치"
        case .noneModel:
            return "준비중이에요"
        }
    }
}

extension Damagochi {
    var description: String {
        switch kind {
        case .firstModel:
            return "저는 따끔따끔 다마고치 입니당! 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 따끔따금!"
        case .secondModel:
            return "저는 방실방실 다마고치 입니당! 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 방실방실!"
        case .thirdModel:
            return "저는 반짝반짝 다마고치 입니당! 키는 100km 몸무게는 150톤이에용 성격은 화끈하고 날라다닙니당~! 열심히 잘 먹고 잘 클 자신은 있답니당 반짝반짝!"
        case .noneModel:
            return "아직 준비중이에요! 많은 관심 부탁드립니다~!"
        }
    }
}

extension Damagochi {
    static var selectDamagochiList: [[Damagochi]] {
        let list = [
            [Damagochi(kind: .firstModel), Damagochi(kind: .secondModel), Damagochi(kind: .thirdModel)],
            [Damagochi(kind: .noneModel), Damagochi(kind: .noneModel), Damagochi(kind: .noneModel)],
            [Damagochi(kind: .noneModel), Damagochi(kind: .noneModel), Damagochi(kind: .noneModel)],
            [Damagochi(kind: .noneModel), Damagochi(kind: .noneModel), Damagochi(kind: .noneModel)],
            [Damagochi(kind: .noneModel), Damagochi(kind: .noneModel), Damagochi(kind: .noneModel)],
            [Damagochi(kind: .noneModel), Damagochi(kind: .noneModel), Damagochi(kind: .noneModel)],
        ]
        return list
    }
}
