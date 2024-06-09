//
//  SelectViewController.swift
//  Damagochi
//
//  Created by 권대윤 on 6/8/24.
//

import UIKit

import SnapKit

final class SelectViewController: UIViewController {
    
    //MARK: - Properties
    
    var damagochiList: [[Damagochi]] = []
    
    enum PresentType {
        case select
        case change
    }
    var presentType: PresentType = .select
    
    //MARK: - UI Components
    
    private let tableView = UITableView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataList()
        setupTableView()
        configureLayout()
        configureUI()
    }
    
    private func setupDataList() {
        switch presentType {
        case .select:
            self.damagochiList = Damagochi.selectDamagochiList
        case .change:
            self.damagochiList = Damagochi.changeDamagochiList
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SelectTableViewCell.self, forCellReuseIdentifier: SelectTableViewCell.identifier)
        tableView.separatorStyle = .none
    }
    
    private func configureLayout() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureUI() {
        tableView.backgroundColor = .customBackgroundColor
        view.backgroundColor = .customBackgroundColor
        
        switch presentType {
        case .select:
            titleLabel.text = "다마고치 선택하기"
        case .change:
            setupNaviPrimary()
            navigationItem.title = "다마고치 변경하기"
        }
    }
    
    //MARK: - Functions
    
    private func makeViewControllerForPresent(data: Damagochi, image: UIImage?, index: Int) {
        let vc = SelectDetailViewController()
        switch presentType {
        case .select:
            vc.presentType = .select
        case .change:
            vc.presentType = .change
            vc.closureForPopToRootVC = {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
        vc.damagochiImage = image
        vc.damagochi = data
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension SelectViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.damagochiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectTableViewCell.identifier, for: indexPath) as! SelectTableViewCell
        cell.delegate = self
        cell.damagochi = self.damagochiList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}

//MARK: - SelectTableViewCellDelegate

extension SelectViewController: SelectTableViewCellDelegate {
    func handleLeftImageViewTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[0] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[0].kind == .firstModel {
            sendImage = UIImage(named: "1-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
    
    func handleCenterImageViewTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[1] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[1].kind == .secondModel {
            sendImage = UIImage(named: "2-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
    
    func handleRightImageViewTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[2] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[2].kind == .thirdModel {
            sendImage = UIImage(named: "3-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
    
    func handleLeftButtonTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[0] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[0].kind == .firstModel {
            sendImage = UIImage(named: "1-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
    
    func handleCenterButtonTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[1] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[1].kind == .secondModel {
            sendImage = UIImage(named: "2-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
    
    func handleRightButtonTapped(for cell: SelectTableViewCell) {
        guard let data = cell.damagochi?[2] else {return}
        var sendImage: UIImage?
        
        if cell.damagochi?[2].kind == .thirdModel {
            sendImage = UIImage(named: "3-6")
        }
        
        makeViewControllerForPresent(data: data, image: sendImage, index: 0)
    }
}
