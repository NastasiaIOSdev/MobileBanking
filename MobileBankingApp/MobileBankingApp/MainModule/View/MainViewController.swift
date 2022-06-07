//
//  MainViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class MainViewController: UIViewController {

    private var cell: [PaymentsCellModel] = paymentsDataArray
    
    private enum Texts {
        static let greetingLabel = " Добро пожаловать, "
        static let userGreetingLabel = "User !"
        static let mainLabel = "Карты"
    }
    
    private enum Constant {
        static let imageGreting = "carbon_user-avatar-filled"
        static let plusButtonImage = "add-plus"
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
    
    private let greetingView = MainGreetingView(settings: .init(
        image: Constant.imageGreting,
        greeting: Texts.greetingLabel,
        user: Texts.userGreetingLabel))
    
    private lazy var bigLabelAndButtonView = BigLabelButtonView(settings: .init(
        label: Texts.mainLabel,
        image: Constant.plusButtonImage,
        tapHandler: {
            self.plusButtunTapped()
        }))
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainViewController {
    func setupUI() {
        self.setupLayout()
        self.setupCommonData()
    }
    
    func setupCommonData() {
        view.backgroundColor = Colors.backgroundGray.value
        
        self.collectionView.backgroundColor = .clear
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.identifier)
        self.collectionView.register(PaymentsCollectionViewCell.self, forCellWithReuseIdentifier: PaymentsCollectionViewCell.identifier)
    }
    
    func setupLayout() {
        self.view.addSubview(self.greetingView)
        self.greetingView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().offset(Constraints.greetingLabelOffset)
        }
        
        self.view.addSubview(self.bigLabelAndButtonView)
        self.bigLabelAndButtonView.snp.makeConstraints { make in
            make.top.equalTo(self.greetingView.snp.bottom).offset(Constraints.plusButtonViewTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.plusButtonViewLeadingInset)
        }
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.bigLabelAndButtonView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func plusButtunTapped() {
        self.present(NewCardAssembly.build(), animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(
                width: (view.frame.width/3) - Constant.paymetsCelloffset,
                height: Constant.hetghtSectionCellPayments)
        }
        return CGSize(
            width: view.frame.width,
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

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return paymentsDataArray.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            if let itemCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PaymentsCollectionViewCell.identifier,
                for: indexPath) as? PaymentsCollectionViewCell {
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
        print("Нажата ячейка под номером \(indexPath.row)")
    }
}
