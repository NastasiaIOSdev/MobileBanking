//
//  CardView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit
import SnapKit

final class  CardView: UIView {
    
    private enum Constraints {
        static let cardLabelLeadingOffset: CGFloat = 7
        static let expDateLabelTopOffset : CGFloat = 16
        static let expDateNumLabelTopOffset: CGFloat = 4
        static let typeCardImageTopOffset: CGFloat = 18
        static let avBalanceLabelTopOffset: CGFloat = 25
        static let balanceLabelTopOffset: CGFloat = 8
    }
    
    struct Settings {
        let cardNumberLabel: String
        let expareDateLabel: String
        let expareDateNumbersLabel: String
        let typeCardImage: String
        let availableBalanceLabel: String
        let balanceLabel: String
        
        init(cardNumberLabel: String, expareDateLabel: String, expareDateNumbersLabel: String, typeCardImage: String, availableBalanceLabel: String, balanceLabel: String) {
            self.cardNumberLabel = cardNumberLabel
            self.expareDateLabel = expareDateLabel
            self.expareDateNumbersLabel = expareDateNumbersLabel
            self.typeCardImage = typeCardImage
            self.availableBalanceLabel = availableBalanceLabel
            self.balanceLabel = balanceLabel
        }
    }

// MARK: - Property
    
    private let cardNumberLabel = UILabel()
    private let cardLabel = UILabel()
    private let expDateLabel = UILabel()
    private let expDateNumLabel = UILabel()
    private let typeCardImage = UIImageView()
    private let avBalanceLabel = UILabel()
    private let balanceLabel = UILabel()

// MARK: - Init
    
    init(settings: Settings) {
        super.init(frame: .zero)
        self.configureView(with: settings)
        self.setupCommonData()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView(with settings: Settings) {
        self.cardLabel.text = settings.cardNumberLabel
        self.expDateLabel.text = settings.expareDateLabel
        self.expDateNumLabel.text = settings.expareDateNumbersLabel
        self.typeCardImage.image = UIImage(named: settings.typeCardImage)
        self.avBalanceLabel.text = settings.availableBalanceLabel
        self.balanceLabel.text = settings.balanceLabel
    }
}

// MARK: - Setup CommonData

private extension CardView {
    
    func setupCommonData() {
        self.setupCardLabel()
        self.setupexpDateLabel()
        self.setupexpDateNumLabel()
        self.setuptypeCardImage()
        self.setupavBalaceLabel()
        self.setupBalaceLabel()
    }
    
    func setupCardLabel() {
        self.cardLabel.font = AppFonts.semibold22.font
        self.cardLabel.textAlignment = .left
        self.cardLabel.adjustsFontSizeToFitWidth = true
        self.cardLabel.textColor = .white
    }
    
    func setupexpDateLabel() {
        self.expDateLabel.font = AppFonts.regular14.font
        self.expDateLabel.textAlignment = .left
        self.expDateLabel.adjustsFontSizeToFitWidth = true
        self.expDateLabel.textColor = .white
    }
    
    func setupexpDateNumLabel() {
        self.expDateNumLabel.font = AppFonts.light14.font
        self.expDateNumLabel.textAlignment = .left
        self.expDateNumLabel.adjustsFontSizeToFitWidth = true
        self.expDateNumLabel.textColor = .white
    }
    
    func setuptypeCardImage() {
        self.typeCardImage.contentMode = .scaleAspectFill
    }
    
    func setupavBalaceLabel() {
        self.avBalanceLabel.font = AppFonts.light14.font
        self.avBalanceLabel.textColor = .white
        self.avBalanceLabel.numberOfLines = 2
        self.avBalanceLabel.textAlignment = .right
        self.avBalanceLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setupBalaceLabel() {
        self.balanceLabel.font = AppFonts.bold22.font
        self.balanceLabel.textColor = .white
        self.balanceLabel.textAlignment = .right
        self.balanceLabel.adjustsFontSizeToFitWidth = true
    }
}

// MARK: - Setup Layout

private extension CardView {
   
    func setupLayout() {
        self.addSubview(self.cardLabel)
        self.cardLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(Constraints.cardLabelLeadingOffset)
        }
        
        self.addSubview(self.expDateLabel)
        self.expDateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cardLabel.snp.bottom).offset(Constraints.expDateLabelTopOffset)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.expDateNumLabel)
        self.expDateNumLabel.snp.makeConstraints { make in
            make.top.equalTo(self.expDateLabel.snp.bottom).offset(Constraints.expDateNumLabelTopOffset)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.typeCardImage)
        self.typeCardImage.snp.makeConstraints { make in
            make.top.equalTo(self.expDateNumLabel.snp.bottom).offset(Constraints.typeCardImageTopOffset)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.avBalanceLabel)
        self.avBalanceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cardLabel.snp.bottom).offset(Constraints.avBalanceLabelTopOffset)
            make.trailing.equalToSuperview()
        }
        
        self.addSubview(self.balanceLabel)
        self.balanceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.avBalanceLabel.snp.bottom).offset(Constraints.balanceLabelTopOffset)
            make.trailing.equalToSuperview()
        }
    }
}
