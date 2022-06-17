//
//  CustomMainView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit
import SnapKit

protocol ICustomMainView: AnyObject {
    var plusButtunTappedActionHandler: (() -> ())? { get set }
}

final class CustomMainView: UIView, ICustomMainView {
    
// MARK: - Property
    
    var plusButtunTappedActionHandler: (() -> ())?
    
    private var cell: [PaymentsCellModel] = paymentsDataArray
    
    private let greetingView = MainGreetingView(settings: .init(
        image: Constant.imageGreting,
        greeting: Texts.greetingLabel,
        user: Texts.userGreetingLabel))
    
    private lazy var bigLabelAndButtonView = BigLabelButtonView(settings: .init(
        label: Texts.mainLabel,
        font: .bold34,
        image: Constant.plusButtonImage,
        color: .redColor,
        tapHandler: {
            self.plusButtunTappedActionHandler?()
        }))
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
// MARK: - Init
    
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

// MARK: - Setup Layout & CommonData

private extension CustomMainView {
    func setupUI() {
        self.setupLayout()
        self.setupCommonData()
    }
    
    func setupCommonData() {
        
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        self.collectionView.register(PaymentsCollectionViewCell.self, forCellWithReuseIdentifier: PaymentsCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        self.addSubview(self.greetingView)
        self.greetingView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().offset(Constraints.greetingLabelOffset)
        }
        
        self.addSubview(self.bigLabelAndButtonView)
        self.bigLabelAndButtonView.snp.makeConstraints { make in
            make.top.equalTo(self.greetingView.snp.bottom).offset(Constraints.plusButtonViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.plusButtonViewLeadingInset)
        }
        
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.bigLabelAndButtonView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - CollectionView DelegateFlowLayout

extension CustomMainView:  UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(
                width: (frame.width/3) - Constant.paymetsCelloffset,
                height: Constant.hetghtSectionCellPayments)
        }
        return CGSize(
            width: frame.width,
            height: Constant.heightSectionCellCard)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(
                top: Constant.uiEdgeInsetPaymentsCellTopBottom,
                left: Constant.uiEdgeInsetPaymentsCellLeadingTrailing,
                bottom: Constant.uiEdgeInsetPaymentsCellTopBottom,
                right: Constant.uiEdgeInsetPaymentsCellLeadingTrailing)
        }
        return UIEdgeInsets(
            top: Constant.uiEdgeInsetCardCellTopBottom,
            left: Constant.uiEdgeInsetCardCellLeadingTrailing,
            bottom: Constant.uiEdgeInsetCardCellTopBottom,
            right: Constant.uiEdgeInsetCardCellLeadingTrailing)
    }
}

// MARK: - CollectionView Delegate & Datasource

extension CustomMainView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constant.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return paymentsDataArray.count
        }
        return Constant.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if let itemCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PaymentsCollectionViewCell.identifier,
                for: indexPath) as? PaymentsCollectionViewCell {
                itemCell.cell = paymentsDataArray[indexPath.row]
                return itemCell
            }
            return UICollectionViewCell()
        }
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCell.identifier,
            for: indexPath) as? CardCell {
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Нажата ячейка под индексом - \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
            cell.layer.transform = transform
            UIView.animate(withDuration: 0.9) {
                cell.alpha = 1
                cell.layer.transform = CATransform3DIdentity
            }
        }
    }
}

// MARK: - Constants, Texts, Constraints

private extension CustomMainView {
    private enum Texts {
        static let greetingLabel = " Добро пожаловать, "
        static let userGreetingLabel = "User !"
        static let mainLabel = "Карты"
    }
    
    private enum Constant {
        static let imageGreting = "carbon_user-avatar-filled"
        static let plusButtonImage = "add-plus"
        static let numberOfSections = 2
        static let numberOfItemsInSection = 1
        static let hetghtSectionCellPayments: CGFloat = 76
        static let heightSectionCellCard: CGFloat = 180
        static let paymetsCelloffset: CGFloat = 16
        static let uiEdgeInsetPaymentsCellTopBottom: CGFloat = 10
        static let uiEdgeInsetPaymentsCellLeadingTrailing: CGFloat = 8
        static let uiEdgeInsetCardCellTopBottom: CGFloat = 10
        static let uiEdgeInsetCardCellLeadingTrailing: CGFloat = 0
    }
    
    private enum Constraints {
        static let greetingLabelOffset = 16
        static let plusButtonViewTopOffset = 5
        static let plusButtonViewLeadingInset = 16
    }
}
