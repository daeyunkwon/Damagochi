//
//  SelectTableViewCell.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

import SnapKit

final class SelectTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    var damagochi: [Damagochi]? {
        didSet {
            guard let leftItem = damagochi?[0] else {return}
            guard let centerItem = damagochi?[1] else {return}
            guard let rightItem = damagochi?[2] else {return}
            
            leftDamagochiImageView.image = leftItem.kind != .noneModel ? UIImage(named: "1-6") : UIImage(named: "noImage")
            centerDamagochiImageView.image = centerItem.kind != .noneModel ? UIImage(named: "2-6") : UIImage(named: "noImage")
            rightDamagochiImageView.image = rightItem.kind != .noneModel ? UIImage(named: "3-6") : UIImage(named: "noImage")
            
            leftNameButton.setTitle(leftItem.damagochiName, for: .normal)
            centerNameButton.setTitle(centerItem.damagochiName, for: .normal)
            rightNameButton.setTitle(rightItem.damagochiName, for: .normal)
        }
    }
    
    weak var delegate: SelectTableViewCellDelegate?
    
    //MARK: - UI Components
    
    private lazy var leftDamagochiImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(leftImageViewTapped))
        iv.addGestureRecognizer(tapGesture)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private lazy var leftNameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .minimumSize
        btn.tintColor = UIColor.customFontColor
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.addTarget(self, action: #selector(leftNameButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var centerDamagochiImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(centerImageViewTapped))
        iv.addGestureRecognizer(tapGesture)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private lazy var centerNameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .minimumSize
        btn.tintColor = UIColor.customFontColor
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.addTarget(self, action: #selector(centerNameButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var rightDamagochiImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(rightImageViewTapped))
        iv.addGestureRecognizer(tapGesture)
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    private lazy var rightNameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .minimumSize
        btn.tintColor = UIColor.customFontColor
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.addTarget(self, action: #selector(rightNameButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: - Init
    
    override func prepareForReuse() {
        super.prepareForReuse()
        [leftDamagochiImageView, centerDamagochiImageView, rightDamagochiImageView].forEach { iv in
            iv.image = nil
        }
        [leftNameButton, centerNameButton, rightNameButton].forEach {
            $0.setTitle("", for: .normal)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        contentView.backgroundColor = .customBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        contentView.addSubview(leftDamagochiImageView)
        leftDamagochiImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.leading.equalTo(contentView.snp.leading).offset(20)
            make.width.height.equalTo(100)
        }
        
        contentView.addSubview(leftNameButton)
        leftNameButton.snp.makeConstraints { make in
            make.top.equalTo(leftDamagochiImageView.snp.bottom).offset(5)
            make.leading.equalTo(leftDamagochiImageView.snp.leading)
            make.trailing.equalTo(leftDamagochiImageView.snp.trailing)
            
        }
        
        contentView.addSubview(centerDamagochiImageView)
        centerDamagochiImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.centerX.equalTo(contentView.snp.centerX)
            make.width.height.equalTo(100)
        }
        
        contentView.addSubview(centerNameButton)
        centerNameButton.snp.makeConstraints { make in
            make.top.equalTo(centerDamagochiImageView.snp.bottom).offset(5)
            make.leading.equalTo(centerDamagochiImageView.snp.leading)
            make.trailing.equalTo(centerDamagochiImageView.snp.trailing)
        }
        
        contentView.addSubview(rightDamagochiImageView)
        rightDamagochiImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20)
            make.width.height.equalTo(100)
        }
        
        contentView.addSubview(rightNameButton)
        rightNameButton.snp.makeConstraints { make in
            make.top.equalTo(rightDamagochiImageView.snp.bottom).offset(5)
            make.leading.equalTo(rightDamagochiImageView.snp.leading)
            make.trailing.equalTo(rightDamagochiImageView.snp.trailing)
        }
    }
    
    //MARK: - Functions
    
    @objc func leftImageViewTapped() {
        self.delegate?.handleLeftImageViewTapped(for: self)
    }
    
    @objc func centerImageViewTapped() {
        self.delegate?.handleCenterImageViewTapped(for: self)
    }
    
    @objc func rightImageViewTapped() {
        self.delegate?.handleRightImageViewTapped(for: self)
    }
    
    @objc func leftNameButtonTapped() {
        self.delegate?.handleLeftButtonTapped(for: self)
    }
    
    @objc func centerNameButtonTapped() {
        self.delegate?.handleCenterButtonTapped(for: self)
    }
    
    @objc func rightNameButtonTapped() {
        self.delegate?.handleRightButtonTapped(for: self)
    }
}
