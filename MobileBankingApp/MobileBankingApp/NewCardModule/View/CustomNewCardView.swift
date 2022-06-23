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
    
    // MARK: - Propery
    
    private let scrolView = UIScrollView()
    private let view = UIView()
    
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
        logoBankImage: Constants.logoBankImage,
        chipImage: Constants.chipImage,
        cardNumberLabel: Texts.cardNamberLabelText,
        cardHolderLabel: Texts.cardHolderLabelText,
        cardHolderNameLabel: Texts.nameCardOwnerTFvalueText,
        expareDateLabel: Texts.expareDateLabelTaxt,
        expareDateNumbersLabel: Texts.expareDateNumbersLabelText,
        typeCardImage: Constants.typeCardImage))
    
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

// MARK: - Init
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layout

private extension CustomNewCardView {
   
    func setupUI() {
        self.customCardViewImage.image = UIImage(named: "card_backgr")
        
        self.addSubview(self.scrolView)
        self.scrolView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.scrolView.addSubview(self.view)
        self.view.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.view.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constraints.pageLabelTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.pageLabelLeadingInset)
        }
        
        self.view.addSubview(self.cardView)
        self.cardView.snp.makeConstraints { make in
            make.top.equalTo(self.pageLabel.snp.bottom).offset(Constraints.cardViewTopOffset)
            make.centerX.equalToSuperview()
            make.height.equalTo(Constants.cardViewHeight)
            make.width.equalTo(Constants.cardViewWith)
        }
        
        self.cardView.addSubview(self.customCardViewImage)
        self.customCardViewImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        self.customCardViewImage.addSubview(self.customCardView)
        self.customCardView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(Constraints.customCardViewTopInset)
            make.bottom.equalToSuperview().inset(Constraints.customCardViewBottomInset)
            make.leading.equalToSuperview().inset(Constraints.customCardViewLeadingInset)
            make.trailing.equalToSuperview().inset(Constraints.customCardViewTrailingInset)
        }
        
        self.view.addSubview(self.nameCardOwnerTF)
        self.nameCardOwnerTF.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.bottom).offset(Constraints.nameCardOwnerTFTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.nameCardOwnerTFLeadingInset)
        }
        
        self.view.addSubview(self.cardNumberTF)
        self.cardNumberTF.snp.makeConstraints { make in
            make.top.equalTo(self.nameCardOwnerTF.snp.bottom).offset(Constraints.cardNumberTFTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.cardNumberTFLeadingInset)
        }
        
        self.view.addSubview(self.expDateTF)
        self.expDateTF.snp.makeConstraints { make in
            make.top.equalTo(self.cardNumberTF.snp.bottom).offset(Constraints.expDateTFTopOffset)
            make.leading.equalToSuperview().inset(Constraints.expDateTFLeadingInsrt)
        }
        
        self.view.addSubview(self.cvvTextField)
        self.cvvTextField.snp.makeConstraints { make in
            make.top.equalTo(self.cardNumberTF.snp.bottom).offset(Constraints.cvvTextFieldTopOffset)
            make.leading.equalTo(self.expDateTF.snp.trailing).offset(Constraints.cvvTextFieldLeadingOffset)
            make.trailing.equalToSuperview().inset(Constraints.cvvTextFieldTrailingInset)
        }
        
        self.view.addSubview(self.addCardButton)
        self.addCardButton.snp.makeConstraints { make in
            make.top.equalTo(self.expDateTF.snp.bottom).offset(Constraints.addCardButtonTopOffset)
            make.leading.equalToSuperview().inset(Constraints.addCardButtonLeadingInset)
            make.trailing.equalToSuperview().inset(Constraints.addCardButtonTrailingInset)
            make.bottom.equalToSuperview().offset(Constraints.addCardButtonBottomOffset)
        }
    }
}

// MARK: - Constants, Constraints, Texts

private extension CustomNewCardView {
    private enum Constants {
        static let pageLabelImage = "cross_btn"
        static let typeCardImage = "mc_symbol 4"
        static let logoBankImage = "logo_on_card"
        static let chipImage = "chip"
        static let availableBalanceLabelText = "Card holder"
        static let cardViewHeight = 216
        static let cardViewWith = 340
        
    }
    
    private enum Texts {
        static let pageLabelText = "Добавить Карту"
        static let cardNamberLabelText = "* * * *  * * * *  * * * *  4568"
        static let expareDateLabelTaxt = "Expiry Date"
        static let expareDateNumbersLabelText = "09/24"
        static let cardHolderLabelText = "Card holder"
        static let nameCardOwnerTFHeaderText = "Имя владельца карты"
        static let nameCardOwnerTFvalueText = "Ivanov Ivan"
        static let cardNumberTFHeaderText = "Номер карты"
        static let cardNumberTFValueText = "3485 1245 9875 4568"
        static let expDateTFHeaderText = "Дата истечения срока"
        static let expDateTFValueText = "09 / 24 "
        static let cvvTextFieldHeaderText = "CVV"
        static let cvvTextFieldValueText = "722"
        static let addCardButtonLabelText = "Добавить карту"
    }
    
    private enum Constraints {
        static let pageLabelTopOffset: CGFloat = 25
        static let pageLabelLeadingInset: CGFloat = 16
        static let cardViewTopOffset: CGFloat = 26
        static let customCardViewTopInset: CGFloat = 23
        static let customCardViewBottomInset: CGFloat = 18
        static let customCardViewLeadingInset: CGFloat = 28
        static let customCardViewTrailingInset: CGFloat = 18
        static let nameCardOwnerTFTopOffset: CGFloat = 25
        static let nameCardOwnerTFLeadingInset: CGFloat = 16
        static let cardNumberTFTopOffset: CGFloat = 25
        static let cardNumberTFLeadingInset: CGFloat = 16
        static let expDateTFTopOffset: CGFloat = 25
        static let expDateTFLeadingInsrt: CGFloat = 16
        static let cvvTextFieldTopOffset: CGFloat = 25
        static let cvvTextFieldLeadingOffset: CGFloat = 25
        static let cvvTextFieldTrailingInset: CGFloat = 16
        static let addCardButtonTopOffset: CGFloat = 35
        static let addCardButtonLeadingInset: CGFloat = 16
        static let addCardButtonTrailingInset: CGFloat = 16
        static let addCardButtonBottomOffset: CGFloat = -68
    }
    
}
