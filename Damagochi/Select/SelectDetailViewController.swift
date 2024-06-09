//
//  SelectDetailViewController.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

import SnapKit

final class SelectDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    enum PresentType {
        case select
        case change
    }
    var presentType: PresentType = .select
    
    var damagochiImage: UIImage?
    var damagochi: Damagochi?
    
    let damagochiManager = DamagochiManager.shared
    
    var closureForPopToRootVC: (() -> Void) = {}
    
    //MARK: - UI Components
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .customBackgroundColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private let damagochiImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let nameButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .maximumSize
        btn.tintColor = UIColor.customFontColor
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        return btn
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .customFontColor
        return view
    }()
    
    private let descriptionTextView: UITextView = {
        let tv = UITextView()
        tv.textColor = .customFontColor
        tv.font = .middleSize
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        tv.textAlignment = .center
        return tv
    }()
    
    private lazy var cancelButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("취소", for: .normal)
        btn.titleLabel?.font = .maximumSize
        btn.setBackgroundColor(.customBackgroundColor, for: .normal)
        btn.setBackgroundColor(.customFontColor, for: .highlighted)
        btn.layer.maskedCorners = [.layerMinXMaxYCorner]
        btn.layer.cornerRadius = 5
        btn.clipsToBounds = true
        btn.layer.borderWidth = 0.1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        btn.tintColor = .customFontColor
        return btn
    }()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.titleLabel?.font = .maximumSize
        btn.tintColor = .customFontColor
        btn.setBackgroundColor(.customBackgroundColor, for: .normal)
        btn.setBackgroundColor(.customFontColor, for: .highlighted)
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 0.1
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureUI()
    }
    
    private func configureLayout() {
        view.addSubview(backView)
        backView.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.snp.horizontalEdges).inset(40)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(160)
        }
        
        view.addSubview(damagochiImageView)
        damagochiImageView.snp.makeConstraints { make in
            make.width.height.equalTo(130)
            make.centerX.equalTo(backView.snp.centerX)
            make.top.equalTo(backView.snp.top).offset(60)
        }
        
        view.addSubview(nameButton)
        nameButton.snp.makeConstraints { make in
            make.top.equalTo(damagochiImageView.snp.bottom).offset(10)
            make.centerX.equalTo(backView.snp.centerX)
            make.width.equalTo(120)
            make.height.equalTo(33)
        }
        
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(nameButton.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(backView.snp.horizontalEdges).inset(50)
            make.height.equalTo(1)
        }
        
        view.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(backView.snp.horizontalEdges).inset(50)
            make.bottom.equalTo(backView.snp.bottom).offset(-70)
        }
        
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(backView.snp.leading)
            make.bottom.equalTo(backView.snp.bottom)
            make.height.equalTo(50)
            make.trailing.equalTo(backView.snp.centerX)
        }
        
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.trailing.equalTo(backView.snp.trailing)
            make.bottom.equalTo(backView.snp.bottom)
            make.height.equalTo(50)
            make.leading.equalTo(backView.snp.centerX)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.4)
        damagochiImageView.image = self.damagochiImage ?? UIImage(named: "noImage")
        nameButton.setTitle(damagochi?.damagochiName, for: .normal)
        descriptionTextView.text = damagochi?.description
        
        switch presentType {
        case .select:
            startButton.setTitle("시작하기", for: .normal)
        case .change:
            startButton.setTitle("변경하기", for: .normal)
        }
    }
    
    //MARK: - Functions
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc func startButtonTapped() {
        guard let damagochi = self.damagochi else {return}
        
        switch damagochi.kind {
        case .firstModel:
            switch presentType {
            case .select:
                damagochiManager.create(kind: .firstModel)
            case .change:
                damagochiManager.changeKind(kind: .firstModel)
            }
        case .secondModel:
            switch presentType {
            case .select:
                damagochiManager.create(kind: .secondModel)
            case .change:
                damagochiManager.changeKind(kind: .secondModel)
            }
        case .thirdModel:
            switch presentType {
            case .select:
                damagochiManager.create(kind: .thirdModel)
            case .change:
                damagochiManager.changeKind(kind: .thirdModel)
            }
        case .noneModel:
            showAlert(message: "아직 준비중으로 선택할 수 없습니다.")
            return
        }
        
        if presentType == .select {
            view.window?.rootViewController?.dismiss(animated: true)
        } else if presentType == .change {
            dismiss(animated: true) {
                self.closureForPopToRootVC()
            }
        }
    }
}
