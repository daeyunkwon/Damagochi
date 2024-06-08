//
//  Damagochi.swift
//  Damagochi
//
//  Created by 권대윤 on 6/7/24.
//

import UIKit

enum Kind: Codable {
    case firstModel
    case secondModel
    case thirdModel
    case noneModel
}

enum CommentType: Codable {
    case eat
    case drink
    case show
}

struct Damagochi: Codable {
    
    var userName: String
    var level: Int
    var eat: Int
    var drink: Int
    var kind: Kind
    var commentType: CommentType
    
    enum CodingKeys: String, CodingKey {
        case userName
        case level
        case eat
        case drink
        case kind
        case commentType
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.level = try container.decode(Int.self, forKey: .level)
        self.eat = try container.decode(Int.self, forKey: .eat)
        self.drink = try container.decode(Int.self, forKey: .drink)
        self.kind = try container.decode(Kind.self, forKey: .kind)
        self.commentType = try container.decode(CommentType.self, forKey: .commentType)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userName, forKey: .userName)
        try container.encode(self.level, forKey: .level)
        try container.encode(self.eat, forKey: .eat)
        try container.encode(self.drink, forKey: .drink)
        try container.encode(self.kind, forKey: .kind)
        try container.encode(self.commentType, forKey: .commentType)
    }
    
    init(kind: Kind) {
        if let data = UserDefaultsManager.damagochi {
            self.userName = data.userName
            self.level = data.level
            self.eat = data.eat
            self.drink = data.drink
            self.kind = data.kind
            self.commentType = data.commentType
        } else {
            self.userName = "대장"
            self.level = 1
            self.eat = 0
            self.drink = 0
            self.kind = kind
            self.commentType = .show
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
    var commnet: String {
        switch commentType {
        case .eat:
            let list = [
                "음식을 주셔서 감사해요 \(self.userName)님!",
                "정말 맛있네요 \(self.userName)님!",
                "냠냠 쩝쩝",
            ]
            return list.randomElement() ?? ""
        case .drink:
            let list = [
                "마실 물을 주셔서 감사해요 \(self.userName)님!",
                "정말 시원하네요 \(self.userName)님!",
                "꿀꺽 꿀꺽",
            ]
            return list.randomElement() ?? ""
        case .show:
            let list = [
                "안녕하세요 \(self.userName)님!",
                "반가워요 \(self.userName)님!",
                "오늘은 왠지 기분이 좋아요",
            ]
            return list.randomElement() ?? ""
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
