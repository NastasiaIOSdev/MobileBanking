//
//  CardCollectionViewCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit
import SnapKit

final class CardCollectionViewCell: UICollectionViewCell {
    
// MARK: - Property
    
    static let identifier = "CardCollectionViewCell"
    private let cellView = UIView()
    private let imageView = UIImageView()
    private lazy var cardView = CardView(settings: .init(
        cardNumberLabel: Texts.cardViewCardNumberLabelText,
        expareDateLabel: Texts.cardViewExpareDateLabelText,
        expareDateNumbersLabel: Texts.cardViewExpareDateNumbersLabel,
        typeCardImage: Texts.cardTypeImage,
        availableBalanceLabel: Texts.cardViewAvailableBalanceLabel,
        balanceLabel: Texts.cardViewBalanceLabel))

// MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - layout Subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
    }
}

// MARK: - Setup Layout & CommonData

private extension CardCollectionViewCell {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.cellView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = UIImage(named: Texts.nameImageView)
    }
    
    func setupLayout() {
        self.addSubview(self.cellView)
        self.cellView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        self.cellView.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        self.imageView.addSubview(self.cardView)
        self.cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constraints.imageTopInset)
            make.bottom.equalToSuperview().inset(Constraints.imageBottomInset)
            make.leading.equalTo(self.imageView.snp.leading).inset(Constraints.imageLeadingInset)
            make.trailing.equalTo(self.imageView.snp.trailing).inset(Constraints.imageTrailingInset)
        }
    }
}

// MARK: - Constraints, Texts

private extension CardCollectionViewCell {
    
    private enum Texts {
        static let nameImageView = "card"
        static let cardTypeImage = "icons8-visa"
        static let cardViewCardNumberLabelText = "* * * * * * * * * * * * 3498"
        static let cardViewExpareDateLabelText = "Expiry Date"
        static let cardViewExpareDateNumbersLabel = "05/23"
        static let cardViewAvailableBalanceLabel = "Available\nBalance"
        static let cardViewBalanceLabel = "3033 RUB"
    }
    
    private enum Constraints {
        static let imageTopInset: CGFloat = 27
        static let imageBottomInset: CGFloat = 29
        static let imageLeadingInset: CGFloat = 48
        static let imageTrailingInset: CGFloat = 43
    }
}
