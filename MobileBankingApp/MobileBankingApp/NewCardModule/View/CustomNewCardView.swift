//
//  CustomNewCardView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit
import SnapKit

protocol ICustomNewCardView: AnyObject {
    var dismissButtonTappedActionHandler: (() -> ())? { get set }
    var addCardButtonTappedActionHandler: (() -> ())? { get set }
}

final class CustomNewCardView: UIView, ICustomNewCardView {
    
    private enum Constants {
        static let pageLabelImage = "cross_btn"
        static let typeCardImage = "mc_symbol 4"
        static let availableBalanceLabelText = "Card holder"
        
    }
    private enum Texts {
        static let pageLabelText = "Добавить Карту"
        static let cardNamberLabelText = "* * * *  * * * *  * * * *  4568"
        static let expareDateLabelTaxt = "Card holder"
        static let expareDateNumbersLabelText = "Card holder"
        static let balanceLabelText = "Card holder"
        static let nameCardOwnerTFHeaderText = "Имя владельца карты"
        static let nameCardOwnerTFvalueText = "Ivanov Ivan"
        static let cardNumberTFHeaderText = "Номер карты"
        static let cardNumberTFValueText = "3485 1245 9875 4568"
        static let expDateTFHeaderText = "Дата истечения срока"
        static let expDateTFValueText = "09 / 24 "
        static let cvvTextFieldHeaderText = "CVV"
        static let cvvTextFieldValueText = "722"
        static let addCardButtonLabelText = "Добавить"
    }
    
    private enum Constraints {
        
    }
    
    // MARK: - Propery
    private let scrolView = UIScrollView()
    
    private lazy var pageLabel = BigLabelButtonView(settings: .init(
        label: Texts.pageLabelText,
        font: .bold22,
        image: Constants.pageLabelImage,
        color: .black,
        tapHandler: {
            self.dismissButtonTappedActionHandler!()
        }))
    
    var dismissButtonTappedActionHandler: (() -> ())?
    var addCardButtonTappedActionHandler: (() -> ())?
    
    private let cardView = UIView()
    private let customCardViewImage = UIImageView()
    private let customCardView = NewCardCustomView(settings: .init(
        cardNumberLabel: Texts.cardNamberLabelText,
        expareDateLabel: Texts.expareDateLabelTaxt,
        expareDateNumbersLabel: Texts.expareDateNumbersLabelText,
        typeCardImage: Constants.typeCardImage,
        availableBalanceLabel: Constants.availableBalanceLabelText,
        balanceLabel: Texts.balanceLabelText))
    
    private let nameCardOwnerTF = OwnerCardTextFieldView(settings: .init(
        header: Texts.nameCardOwnerTFHeaderText,
        value: Texts.nameCardOwnerTFvalueText))
    
    private let cardNumberTF = OwnerCardTextFieldView(settings: .init(
        header: Texts.cardNumberTFHeaderText,
        value: Texts.cardNumberTFValueText))
    
    private let expDateTF = OwnerCardTextFieldView(settings: .init(
        header: Texts.expDateTFHeaderText,
        value: Texts.expDateTFValueText))
    
    private let cvvTextField = OwnerCardTextFieldView(settings: .init(
        header: Texts.cvvTextFieldHeaderText,
        value: Texts.cvvTextFieldValueText))
    
    private lazy var addCardButton = CustomButtonView(settings: .init(
        labelText: Texts.addCardButtonLabelText,
        font: .medium17,
        tapHandler: {
            self.addCardButtonTappedActionHandler!()
        }))
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomNewCardView {
    func setupUI() {
        self.customCardViewImage.image = UIImage(named: "card_backgr")
        
        self.addSubview(self.scrolView)
        self.scrolView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.scrolView.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.scrolView.addSubview(self.cardView)
        self.cardView.snp.makeConstraints { make in
            make.top.equalTo(self.pageLabel.snp.bottom).offset(26)
            make.centerX.equalToSuperview()
            make.height.equalTo(216)
            make.width.equalTo(340)
        }
        
        self.cardView.addSubview(self.customCardViewImage)
        self.customCardViewImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.customCardViewImage.addSubview(self.customCardView)
        self.customCardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(23)
            make.bottom.equalToSuperview().inset(18)
            make.leading.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(18)
        }
        
        self.scrolView.addSubview(self.nameCardOwnerTF)
        self.nameCardOwnerTF.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.scrolView.addSubview(self.cardNumberTF)
        self.cardNumberTF.snp.makeConstraints { make in
            make.top.equalTo(self.nameCardOwnerTF.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.scrolView.addSubview(self.expDateTF)
        self.expDateTF.snp.makeConstraints { make in
            make.top.equalTo(self.cardNumberTF.snp.bottom).offset(25)
            make.leading.equalToSuperview().inset(16)
        }
        
        self.scrolView.addSubview(self.cvvTextField)
        self.cvvTextField.snp.makeConstraints { make in
            make.top.equalTo(self.cardNumberTF.snp.bottom).offset(25)
            make.leading.equalTo(self.expDateTF.snp.trailing).offset(25)
            make.trailing.equalToSuperview().inset(16)
        }
        
        self.scrolView.addSubview(self.addCardButton)
        self.addCardButton.snp.makeConstraints { make in
            make.top.equalTo(self.expDateTF.snp.bottom).offset(35)
            make.leading.equalToSuperview().inset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-68)
        }
    }
}
