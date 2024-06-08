//
//  Reuseable.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

protocol Reuseable: AnyObject {
    static var identifier: String {get}
}

extension UITableViewCell: Reuseable {
    static var identifier: String {
        return String(describing: self)
    }
}
