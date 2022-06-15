//
//  NewCardViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

class NewCardViewController: UIViewController {
    
    private enum Constants {
        
    }
    private enum Taxsts {
        
    }
    
    private enum Constraints {
        
    }
    
    // MARK: - Propery
    private let scrolView = UIScrollView()
    
    private lazy var pageLabel = BigLabelButtonView(settings: .init(
        label: "Добавить Карту",
        font: .bold22,
        image: "cross_btn",
        color: .black,
        tapHandler: {
            self.dismissButtonTapped()
        }))
    
    private let cardView = UIView()
    private let customCardViewImage = UIImageView()
    private let customCardView = NewCardCustomView(settings: .init(
        cardNumberLabel: "* * * *  * * * *  * * * *  4568",
        expareDateLabel: "Card holder",
        expareDateNumbersLabel: "Card holder",
        typeCardImage: "mc_symbol 4",
        availableBalanceLabel: "Card holder",
        balanceLabel: "Card holder"))
    
    private let nameCardOwnerTF = OwnerCardTextFieldView(settings: .init(
        header: "Имя владельца карты",
        value: "Ivanov Ivan"))
    
    private let cardNumberTF = OwnerCardTextFieldView(settings: .init(
        header: "Номер карты",
        value: "3485 1245 9875 4568"))
    
    private let expDateTF = OwnerCardTextFieldView(settings: .init(
        header: "Дата истечения срока",
        value: "09 / 24 "))
    
    private let cvvTextField = OwnerCardTextFieldView(settings: .init(
        header: "CVV",
        value: "722"))
    
    private lazy var addCardButton = CustomButtonView(settings: .init(
        labelText: "Добавить",
        font: .medium17,
        tapHandler: self.addCardButtonTapped))
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()
    }
}

private extension NewCardViewController {
    
    func dismissButtonTapped() {
        self.dismiss(animated: true)
    }
    
    func addCardButtonTapped() {
        self.dismiss(animated: true)
    }
    
    func setupUI() {
        self.customCardViewImage.image = UIImage(named: "card_backgr")
        
        self.view.addSubview(self.scrolView)
        self.scrolView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
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
