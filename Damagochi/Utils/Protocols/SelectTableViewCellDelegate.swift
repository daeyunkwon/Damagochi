//
//  SelectTableViewCellDelegate.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import Foundation

protocol SelectTableViewCellDelegate: AnyObject {
    func handleLeftImageViewTapped(for cell: SelectTableViewCell)
    func handleCenterImageViewTapped(for cell: SelectTableViewCell)
    func handleRightImageViewTapped(for cell: SelectTableViewCell)
    func handleLeftButtonTapped(for cell: SelectTableViewCell)
    func handleCenterButtonTapped(for cell: SelectTableViewCell)
    func handleRightButtonTapped(for cell: SelectTableViewCell)
}
