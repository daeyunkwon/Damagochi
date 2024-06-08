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
    
    let damagochiList = Damagochi.selectDamagochiList
    
    //MARK: - UI Components
    
    private let tableView = UITableView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "다마고치 선택하기"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()

    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureLayout()
        configureUI()
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
    }
    
    
    //MARK: - Functions
    

    

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
        cell.damagochi = self.damagochiList[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
