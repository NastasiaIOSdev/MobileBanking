//
//  AccountTableViewCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import UIKit

final class AccountTableViewCell: UITableViewCell {
   
// MARK: - Property
    
    static let identifier = "AccountTableViewCell"
    var cell: AccountCellModel? {
        didSet {
            guard let cell = cell else { return }
            accountCellViewImageView.image = cell.image
            cellLabel.text = cell.name
        }
    }
    private let accountCellViewImageView = UIImageView()
    private let cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = AppFonts.medium17.font
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension AccountTableViewCell {
    func setupUI() {
        self.accountCellViewImageView.tintColor = Colors.redColor.value
        
        self.contentView.addSubview(self.accountCellViewImageView)
        self.accountCellViewImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.height.equalTo(24)
            make.width.equalTo(self.accountCellViewImageView.snp.height)
            make.centerY.equalToSuperview().priority(.high)
        }
        
        self.contentView.addSubview(self.cellLabel)
        self.cellLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalTo(self.accountCellViewImageView.snp.trailing).offset(10)
            make.centerY.equalToSuperview().priority(.high)
        }
    }
}
