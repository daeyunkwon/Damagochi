//
//  ViewController.swift
//  Damagochi
//
//  Created by 권대윤 on 6/7/24.
//

import UIKit

import SnapKit

final class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    let damagochiManager = DamagochiManager.shared
    
    //MARK: - UI Components
    
    private let bubbleImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "bubble")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let bubbleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.maximumSize
        label.textColor = UIColor.customFontColor
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let damagochiImageView: UIImageView = {
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
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.maximumSize
        label.textColor = UIColor.customFontColor
        label.backgroundColor = .clear
        label.textAlignment = .center
        return label
    }()
    
    private let eatInputTextField: UITextField = {
        let tv = UITextField()
        tv.font = UIFont.middleSize
        tv.placeholder = "밥주세용"
        tv.keyboardType = .numberPad
        tv.borderStyle = .none
        tv.backgroundColor = .clear
        tv.textAlignment = .center
        return tv
    }()
    
    private let separatorForEatTextField: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customFontColor
        return view
    }()
    
    private let drinkInputTextField: UITextField = {
        let tv = UITextField()
        tv.font = UIFont.middleSize
        tv.placeholder = "물주세용"
        tv.keyboardType = .numberPad
        tv.borderStyle = .none
        tv.backgroundColor = .clear
        tv.textAlignment = .center
        return tv
    }()
    
    private let separatorForDrinkTextField: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customFontColor
        return view
    }()
    
    private lazy var eatButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.setTitle(" 밥먹기", for: .normal)
        btn.tintColor = .customFontColor
        btn.setImage(UIImage(systemName: "drop.circle"), for: .normal)
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(eatButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var drinkButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.backgroundColor = .clear
        btn.tintColor = .customFontColor
        btn.setTitle(" 물먹기", for: .normal)
        btn.setImage(UIImage(systemName: "leaf.circle"), for: .normal)
        btn.layer.borderColor = UIColor.customFontColor.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(drinkButtonTapped), for: .touchUpInside)
        return btn
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupNavi()
        configureLayout()
        configureUI()
    }
    
    private func setupData() {
        damagochiManager.setup()
        
        if !damagochiManager.isDataAvailable {
            let selectVC = SelectViewController()
            selectVC.modalPresentationStyle = .fullScreen
            present(selectVC, animated: true)
        }
    }
    
    private func setupNavi() {
        title = "대장님의 다마고치"
        
        setupNaviPrimary()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(rightBarButtonTapped))
    }
    
    func configureLayout() {
        view.addSubview(bubbleImageView)
        bubbleImageView.snp.makeConstraints { make in
            make.width.equalTo(260)
            make.height.equalTo(180)
            make.centerX.equalTo(view.snp.centerX)
            make.top.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.bottom.lessThanOrEqualTo(view.keyboardLayoutGuide.snp.top).offset(-500)
        }
        
        bubbleImageView.addSubview(bubbleLabel)
        bubbleLabel.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.top).offset(20)
            make.horizontalEdges.equalTo(bubbleImageView.snp.horizontalEdges).inset(10)
            make.bottom.equalTo(bubbleImageView.snp.bottom).offset(-40)
        }
        
        view.addSubview(damagochiImageView)
        damagochiImageView.snp.makeConstraints { make in
            make.top.equalTo(bubbleImageView.snp.bottom).offset(1)
            make.centerX.equalTo(view.snp.centerX)
            make.width.height.equalTo(230)
        }
        
        view.addSubview(nameButton)
        nameButton.snp.makeConstraints { make in
            make.top.equalTo(damagochiImageView.snp.bottom).offset(10)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(130)
            make.height.equalTo(30)
        }
        
        view.addSubview(stateLabel)
        stateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameButton.snp.bottom).offset(15)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        
        view.addSubview(eatInputTextField)
        eatInputTextField.snp.makeConstraints { make in
            make.top.equalTo(stateLabel.snp.bottom).offset(25)
            make.width.equalTo(160)
            make.height.equalTo(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        view.addSubview(separatorForEatTextField)
        separatorForEatTextField.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(eatInputTextField.snp.bottom)
            make.horizontalEdges.equalTo(eatInputTextField.snp.horizontalEdges)
        }
        
        view.addSubview(eatButton)
        eatButton.snp.makeConstraints { make in
            make.top.equalTo(eatInputTextField.snp.top).offset(-5)
            make.width.equalTo(80)
            make.leading.equalTo(eatInputTextField.snp.trailing).offset(10)
            make.bottom.equalTo(separatorForEatTextField.snp.bottom)
        }
        
        view.addSubview(drinkInputTextField)
        drinkInputTextField.snp.makeConstraints { make in
            make.top.equalTo(separatorForEatTextField.snp.bottom).offset(25)
            make.width.equalTo(160)
            make.height.equalTo(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide).offset(-50)
        }
        
        view.addSubview(separatorForDrinkTextField)
        separatorForDrinkTextField.snp.makeConstraints { make in
            make.height.equalTo(1.0)
            make.top.equalTo(drinkInputTextField.snp.bottom)
            make.horizontalEdges.equalTo(drinkInputTextField.snp.horizontalEdges)
        }
        
        view.addSubview(drinkButton)
        drinkButton.snp.makeConstraints { make in
            make.top.equalTo(drinkInputTextField.snp.top).offset(-5)
            make.width.equalTo(80)
            make.leading.equalTo(drinkInputTextField.snp.trailing).offset(10)
            make.bottom.equalTo(separatorForDrinkTextField.snp.bottom)
        }
    }
    
    private func configureUI() {
        guard let data = damagochiManager.get() else {
            view.backgroundColor = UIColor.customBackgroundColor
            return
        }
        view.backgroundColor = UIColor.customBackgroundColor
        bubbleLabel.text = "오늘은 왠지 기분이 좋아요"
        damagochiImageView.image = data.form
        nameButton.setTitle(data.damagochiName, for: .normal)
        stateLabel.text = "LV\(data.level) • 밥알 \(data.eat)개 • 물방울 \(data.drink)개"
    }
    
    //MARK: - Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func rightBarButtonTapped() {
        print(#function)
    }
    
    @objc func eatButtonTapped() {
        print(#function)
    }
    
    @objc func drinkButtonTapped() {
        print(#function)
    }
    
    
    
    


}

