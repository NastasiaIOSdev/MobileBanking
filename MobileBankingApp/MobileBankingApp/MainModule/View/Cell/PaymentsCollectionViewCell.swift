//
//  PaymentsCollectionViewCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class PaymentsCollectionViewCell: UICollectionViewCell {

// MARK: - Constants, Constraints
    
    private enum Constants {
        static let viewCornerRadius: CGFloat = 10
        static let labelScaleFactor: CGFloat = 0.5
        static let numberOfLines: CGFloat = 2
        static let heightImageView = 24
    }
    
    private enum Constraints {
        static let cellViewInsideInset = 5
        static let nameLabelTopOffset = 6
    }
    
// MARK: - Property
    
    static let identifier = "PaymentsCollectionViewCell"
    private let cellView = UIView()
    private let cellViewInside = UIView()
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    
    var cell: PaymentsCellModel? {
        didSet {
            nameLabel.text = cell?.name
            if let image = cell?.image {
                imageView.image = UIImage(named: image)
            }
        }
    }
    
// MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - layoutSubviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
    }
}

// MARK: - setup CommonData

private extension PaymentsCollectionViewCell {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.setupCellView()
        self.setupCellViewInside()
        self.setupImaveView()
        self.setupNameLabel()
    }
    
    func setupCellView() {
        self.cellView.translatesAutoresizingMaskIntoConstraints = false
        self.cellView.backgroundColor = .white
        self.cellView.layer.cornerRadius = Constants.viewCornerRadius
    }
    
    func setupCellViewInside() {
        self.cellViewInside.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupImaveView() {
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.tintColor = Colors.redColor.value
    }
    
    func setupNameLabel() {
        self.nameLabel.textAlignment = .left
        self.nameLabel.numberOfLines = Int(Constants.numberOfLines)
        self.nameLabel.font = AppFonts.regular15.font
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.textColor = .black
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.nameLabel.minimumScaleFactor = Constants.labelScaleFactor
    }
}

// MARK: - setup Layout

private extension PaymentsCollectionViewCell {
    func setupLayout() {
        self.addSubview(self.cellView)
        self.cellView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(self.cellViewInside)
        self.cellViewInside.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(Constraints.cellViewInsideInset)
        }
        
        self.cellViewInside.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(Constants.heightImageView)
            make.leading.equalToSuperview()
        }
        
        self.cellViewInside.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.imageView.snp.bottom).offset(Constraints.nameLabelTopOffset)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
