//
//  CustomAccountView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit
import SnapKit

protocol ICustomAccountView: AnyObject {
    var logoutButtonTapActionHandler: (() -> ())? { get set }
}

final class CustomAccountView: UIView, ICustomAccountView  {
    
    private enum Constants {
        static let pageLabelImage = "logout"
        static let bigAccountImage = "carbon_user-avatar-filled2"
        static let tableViewRowHeight: CGFloat = 60
        static let accountImageHeight: CGFloat = 86
    }
    
    private enum Constarints {
        static let pagelabelOffset: CGFloat = 16
        static let accountImageTopOffset: CGFloat = 15
        static let userNameLabelTopOffset: CGFloat = 7
    }
    
    private enum Texts {
        static let labelPageLabeltext = "Профиль"
        static let userNameLabelText = "Имя пользователя"
    }
    
// MARK: - Properties
    
    private var itemCell: [AccountCellModel] = accountDataArray
    private let tableView = UITableView()
    
    private lazy var pagelabel = BigLabelButtonView(settings: .init(
        label: Texts.labelPageLabeltext,
        font: .bold34,
        image: Constants.pageLabelImage,
        color: .black,
        tapHandler: {
            self.logoutButtonTapActionHandler?()
        })
    )
    
    var logoutButtonTapActionHandler: (() -> ())?
    
    private let accountImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.bigAccountImage)
        image.tintColor = Colors.redColor.value
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = Texts.userNameLabelText
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.backgroundGray.value
        self.setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layout & UI

private extension CustomAccountView {
    func setupUI() {
        self.setupTableVuew()
        self.setupLayout()
    }
    
    func setupTableVuew() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .clear
        self.tableView.rowHeight = Constants.tableViewRowHeight
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(AccountTableViewCell.self, forCellReuseIdentifier: AccountTableViewCell.identifier)
    }
    
    func setupLayout() {
        self.addSubview(self.pagelabel)
        self.pagelabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(Constarints.pagelabelOffset)
            make.trailing.equalToSuperview().offset(-Constarints.pagelabelOffset)
        }
        
        self.addSubview(self.accountImage)
        self.accountImage.snp.makeConstraints { make in
            make.top.equalTo(self.pagelabel.snp.bottom).offset(Constarints.accountImageTopOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.accountImageHeight)
            make.width.equalTo(self.accountImage.snp.height)
        }
        
        self.addSubview(self.userNameLabel)
        self.userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.accountImage.snp.bottom).offset(Constarints.userNameLabelTopOffset)
            make.leading.equalToSuperview().offset(Constarints.pagelabelOffset)
            make.trailing.equalToSuperview().offset(-Constarints.pagelabelOffset)
        }
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.userNameLabel.snp.bottom).offset(Constarints.accountImageTopOffset)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

// MARK: - TableView DataSourse & Delegate

extension CustomAccountView: UITableViewDataSource, UITableViewDelegate {
    
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

