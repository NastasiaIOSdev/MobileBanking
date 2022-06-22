//
//  NewCardCustomView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation
import UIKit
import SnapKit

class  NewCardCustomView: UIView {

// MARK: - View Settings
    
    struct Settings {
        let logoBankImage: String
        let chipImage: String
        var cardNumberLabel: String
        let cardHolderLabel: String
        let cardHolderNameLabel: String
        let expareDateLabel: String
        let expareDateNumbersLabel: String
        let typeCardImage: String
        
        init(
            logoBankImage: String,
            chipImage: String,
            cardNumberLabel: String,
            cardHolderLabel: String,
            cardHolderNameLabel: String,
            expareDateLabel: String,
            expareDateNumbersLabel: String,
            typeCardImage: String) {
                self.logoBankImage = logoBankImage
                self.cardNumberLabel = cardNumberLabel
                self.chipImage = chipImage
                self.cardHolderLabel = cardHolderLabel
                self.cardHolderNameLabel = cardHolderNameLabel
                self.expareDateLabel = expareDateLabel
                self.expareDateNumbersLabel = expareDateNumbersLabel
                self.typeCardImage = typeCardImage
            }
    }

// MARK: - Constraints
    
    private enum Constraints {
        static let cardLabelTopOffset: CGFloat = 7
        static let cardHolderLabelTopOffset: CGFloat = 41
        static let cardHolderNameLabelTopOffset: CGFloat = 4
        static let expViewTopOffset: CGFloat = 41
        static let expViewLeadingOffset: CGFloat = 65
        static let expDateNumLabelTopOffset: CGFloat = 4
    }
    
// MARK: - Property
    
    private let logoBankImage = UIImageView()
    private let cardLabel = UILabel()
    private let chipImage = UIImageView()
    private let cardHolderLabel = UILabel()
    private let cardHolderNameLabel = UILabel()
    private let expView = UIView()
    private let expDateLabel = UILabel()
    private let expDateNumLabel = UILabel()
    private let typeCardImage = UIImageView()
    
// MARK: - Init
    
    init(settings: Settings) {
        super.init(frame: .zero)
        self.configureView(with: settings)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with settings: Settings) {
        self.cardLabel.text = settings.cardNumberLabel
        self.expDateLabel.text = settings.expareDateLabel
        self.expDateNumLabel.text = settings.expareDateNumbersLabel
        self.typeCardImage.image = UIImage(named: settings.typeCardImage)
        self.logoBankImage.image = UIImage(named: settings.logoBankImage)
        self.chipImage.image = UIImage(named: settings.chipImage)
        self.cardHolderLabel.text = settings.cardHolderLabel
        self.cardHolderNameLabel.text = settings.cardHolderNameLabel
    }
}

// MARK: - CommonData

private extension NewCardCustomView {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.setupLogoImage()
        self.setupChipImage()
        self.setupCardLabel()
        self.setupCardHolderLabel()
        self.setupcardHolderNameLabel()
        self.setupexpDateLabel()
        self.setupexpDateNumLabel()
        self.setuptypeCardImage()
      
    }
    func setupLogoImage() {
        self.logoBankImage.contentMode = .scaleAspectFill
    }
    
    func setupChipImage() {
        self.chipImage.contentMode = .scaleAspectFill
    }
    
    func setupCardLabel() {
        self.cardLabel.font = AppFonts.semibold22.font
        self.cardLabel.textAlignment = .left
        self.cardLabel.adjustsFontSizeToFitWidth = true
        self.cardLabel.textColor = .white
    }
    
    func setupCardHolderLabel() {
        self.cardHolderLabel.font = AppFonts.regular14.font
        self.cardHolderLabel.textAlignment = .left
        self.cardHolderLabel.adjustsFontSizeToFitWidth = true
        self.cardHolderLabel.textColor = .white
    }
    
    func setupcardHolderNameLabel() {
        self.cardHolderNameLabel.font = AppFonts.light14.font
        self.cardHolderNameLabel.textAlignment = .left
        self.cardHolderNameLabel.adjustsFontSizeToFitWidth = true
        self.cardHolderNameLabel.textColor = .white
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
}

// MARK: - Layout

private extension NewCardCustomView {
    
    func setupLayout() {
        self.addSubview(self.logoBankImage)
        self.logoBankImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.chipImage)
        self.chipImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.addSubview(self.cardLabel)
        self.cardLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(Constraints.cardLabelTopOffset)
        }
        
        self.addSubview(self.cardHolderLabel)
        self.cardHolderLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cardLabel.snp.bottom).offset(Constraints.cardHolderLabelTopOffset)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.cardHolderNameLabel)
        self.cardHolderNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.cardHolderLabel.snp.bottom).offset(Constraints.cardHolderNameLabelTopOffset)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(self.expView)
        self.expView.snp.makeConstraints { make in
            make.top.equalTo(self.cardLabel.snp.bottom).offset(Constraints.expViewTopOffset)
            make.leading.equalTo(self.cardHolderLabel.snp.trailing).offset(Constraints.expViewLeadingOffset)
        }
        
        self.expView.addSubview(self.expDateLabel)
        self.expDateLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.expView.addSubview(self.expDateNumLabel)
        self.expDateNumLabel.snp.makeConstraints { make in
            make.top.equalTo(self.expDateLabel.snp.bottom).offset(Constraints.expDateNumLabelTopOffset)
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.addSubview(self.typeCardImage)
        self.typeCardImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
