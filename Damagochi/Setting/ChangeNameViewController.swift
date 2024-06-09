//
//  ChangeNameViewController.swift
//  Damagochi
//
//  Created by 권대윤 on 6/9/24.
//

import UIKit

import SnapKit

final class ChangeNameViewController: UIViewController {
    
    //MARK: - Properties
    
    let damagochiManager = DamagochiManager.shared
    
    //MARK: - UI Components

    private lazy var nameInputTextField: UITextField = {
        let tv = UITextField()
        tv.font = UIFont.middleSize
        tv.textColor = .customFontColor
        tv.keyboardType = .default
        tv.borderStyle = .none
        tv.backgroundColor = .clear
        tv.textAlignment = .left
        tv.returnKeyType = .done
        tv.autocapitalizationType = .none
        tv.autocorrectionType = .no
        tv.placeholder = "대장님 이름을 알려주세요!"
        tv.addTarget(self, action: #selector(doneButtonTapped), for: .editingDidEndOnExit)
        return tv
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customFontColor
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        configureLayout()
        configureUI()
    }
    
    private func setupNavi() {
        setupNaviPrimary()
        
        let save = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveBarButtonTapped))
        navigationItem.rightBarButtonItem = save
        
        navigationItem.title = "대장님 이름 정하기"
    }
    
    private func configureLayout() {
        view.addSubview(nameInputTextField)
        nameInputTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.horizontalEdges.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        
        view.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.top.equalTo(nameInputTextField.snp.bottom).offset(-8)
            make.centerX.equalTo(nameInputTextField.snp.centerX)
            make.width.equalTo(nameInputTextField.snp.width)
            make.height.equalTo(1)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .customBackgroundColor
        guard let username = damagochiManager.get()?.userName else {return}
        nameInputTextField.text = username
    }
    
    //MARK: - Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @objc func saveBarButtonTapped() {
        guard let text = nameInputTextField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty, text.count >= 2 && text.count <= 6 else {
            showAlert(message: "변경할 대장 이름을 2글자 이상 6글자 이하로 입력해주세요")
            return
        }
        
        damagochiManager.updateUsername(name: text)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonTapped() {
        guard let text = nameInputTextField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty, text.count >= 2 && text.count <= 6 else {
            showAlert(message: "변경할 대장 이름을 2글자 이상 6글자 이하로 입력해주세요")
            return
        }
    }
}
