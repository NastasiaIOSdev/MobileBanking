//
//  CurrencyTableViewCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import UIKit

final class CurrencyTableViewCell: UITableViewCell {
    
    static let identifier = "CurrencyTableViewCell"
    
    private enum Constants {
        static let heightCellview = 56
        static let heightImageView = 44
    }
    
    private enum Constraints {
        static let leadingOffset: CGFloat = 16
        static let trailingOfset: CGFloat = -16
        static let charCodeLabelImageViewTopBottomInset = 7
        static let charCodeLabelLeadingOffset = 25
    }
    
// MARK: - Property
    
    var model: CurrencyModel? {
        didSet {
            guard let model = model else { return }
            
            charCodeLabel.text = model.charCode
            valueLabel.text = model.value
            nameLabel.text = model.name
            //currenyImageView.image = cell.imageFlag
            //nameLabel.text = cell.name
        }
    }
    
    private let cellView = UIView()
    private let currenyImageView = UIImageView()
    let charCodeLabel = UILabel()
    let nameLabel = UILabel()
    let valueLabel = UILabel()
    
// MARK: - Init
    
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

// MARK: - Setup CommonData

private extension CurrencyTableViewCell {
    
    func setupUI() {
        self.setupCommonData()
        self.setupLayot()
    }
    
    func setupCommonData() {
        self.cellView.translatesAutoresizingMaskIntoConstraints = false
        
        self.currenyImageView.clipsToBounds = true
        self.currenyImageView.translatesAutoresizingMaskIntoConstraints = false
        self.currenyImageView.contentMode = .scaleAspectFit
        
        self.charCodeLabel.font = AppFonts.medium17.font
        self.charCodeLabel.textColor = .black
        self.charCodeLabel.textAlignment = .left
        
        self.nameLabel.font = AppFonts.regular15.font
        self.nameLabel.numberOfLines = 2
        self.nameLabel.textAlignment = .left
        self.nameLabel.textColor = .gray
        
        self.valueLabel.font = AppFonts.regular16.font
        self.valueLabel.textAlignment = .right
        self.valueLabel.textColor = .black
    }
}

// MARK: - Setup Layout

private extension CurrencyTableViewCell {
    
    func setupLayot() {
        self.addSubview(self.cellView)
        self.cellView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.heightCellview)
            make.leading.equalToSuperview().offset(Constraints.leadingOffset)
            make.trailing.equalToSuperview().offset(Constraints.trailingOfset)
        }
        
        self.cellView.addSubview(self.currenyImageView)
        self.currenyImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.heightImageView)
            make.width.equalTo(self.currenyImageView.snp.height)
            make.leading.equalToSuperview()
        }
        
        self.cellView.addSubview(self.charCodeLabel)
        self.charCodeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constraints.charCodeLabelImageViewTopBottomInset)
            make.leading.equalTo(self.currenyImageView.snp.trailing).offset(Constraints.charCodeLabelLeadingOffset)
        }
        
        self.cellView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.currenyImageView.snp.trailing).offset(Constraints.charCodeLabelLeadingOffset)
            make.bottom.equalToSuperview().inset(Constraints.charCodeLabelImageViewTopBottomInset)
        }
        
        self.cellView.addSubview(self.valueLabel)
        self.valueLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}
