//
//  AccountViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

class AccountViewController: UIViewController {

// MARK: - Properties
    
    var itemCell: [AccountCellModel] = accountDataArray
    private let tableView = UITableView()
    private lazy var pagelabel = BigLabelButtonView(settings: .init(
        label: "Профиль",
        image: "logout",
        tapHandler: {
            self.logoutButtonTapped()
        })
    )
    
    private let accountImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "carbon_user-avatar-filled2")
        image.tintColor = Colors.redColor.value
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = "Имя пользователя"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
// MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.backgroundGray.value
        self.setupUI()
    }
    
// MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI & Layout

private extension AccountViewController {
    func setupUI() {
        self.setupTableVuew()
        self.setupLayout()
    }
    
    func setupTableVuew() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.tableView.rowHeight = 60
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.identifier)
    }
    
    func setupLayout() {
        self.view.addSubview(self.pagelabel)
        self.pagelabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        self.view.addSubview(self.accountImage)
        self.accountImage.snp.makeConstraints { make in
            make.top.equalTo(self.pagelabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(86)
            make.width.equalTo(self.accountImage.snp.height)
        }
        
        self.view.addSubview(self.userNameLabel)
        self.userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.accountImage.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    func logoutButtonTapped() {
        self.dismiss(animated: true)
    }
}

// MARK: - TableView DataSourse & Delegate

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountTableViewCell.identifier, for: indexPath) as? AccountTableViewCell else { return UITableViewCell()}
        cell.cell = accountDataArray[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячека под индексом:\(indexPath.row)")
    }
}
