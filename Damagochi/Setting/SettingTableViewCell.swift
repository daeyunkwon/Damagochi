//
//  SettingTableViewCell.swift
//  Damagochi
//
//  Created by 권대윤 on 6/9/24.
//

import UIKit

import SnapKit

final class SettingTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        imageView?.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerY.equalTo(contentView.snp.centerY)
            make.trailing.equalTo(textLabel!.snp.leading).offset(-20)
        }
        
        let separator = UIView()
        separator.backgroundColor = .systemGray3
        
        contentView.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.trailing.equalTo(textLabel!.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
            make.height.equalTo(0.2)
        }
    }
    
}
