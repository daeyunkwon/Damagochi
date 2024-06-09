//
//  SettingViewController.swift
//  Damagochi
//
//  Created by 권대윤 on 6/9/24.
//

import UIKit

import SnapKit

final class SettingViewController: UIViewController {
    
    //MARK: - Properties
    
    private let damagochiManager = DamagochiManager.shared
    
    //MARK: - UI Components
    
    private let tableView = UITableView()
    
    //MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        setupTableView()
        configureLayout()
        configureUI()
    }
    
    private func setupNavi() {
        navigationItem.title = "설정"
        setupNaviPrimary()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
    }
    
    private func configureLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
    
    private func configureUI() {
        tableView.backgroundColor = .customBackgroundColor
    }
    
    //MARK: - Functions
    
    private func showInitializeDataAlert() {
        let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아냐!", style: .cancel))
        alert.addAction(UIAlertAction(title: "응", style: .default, handler: { okAction in
            self.damagochiManager.deleteData() {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }))
        present(alert, animated: true)
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "내 이름 설정하기"
            cell.imageView?.image = UIImage(systemName: "pencil")
            cell.detailTextLabel?.text = damagochiManager.get()?.userName
        case 1:
            cell.textLabel?.text = "다마고치 변경하기"
            cell.imageView?.image = UIImage(systemName: "moon.fill")
            cell.detailTextLabel?.text = ""
        case 2:
            cell.textLabel?.text = "데이터 초기화"
            cell.imageView?.image = UIImage(systemName: "arrow.clockwise")
            cell.detailTextLabel?.text = ""
        default:
            break
        }
        
        cell.textLabel?.font = .middleSize
        cell.detailTextLabel?.font = .minimumSize
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .customBackgroundColor
        cell.tintColor = .customFontColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            let vc = ChangeNameViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = SelectViewController()
            vc.presentType = .change
            
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            showInitializeDataAlert()
        default:
            break
        }
        
        tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .automatic)
    }
}
