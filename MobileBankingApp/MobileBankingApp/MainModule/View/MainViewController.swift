//
//  MainViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class MainViewController: UIViewController {

    private enum Texts {
        static let greetingLabel = " Добро пожаловать, "
        static let userGreetingLabel = "User !"
        static let mainLabel = "Карты"
    }
    
    private enum Constant {
        static let imageGreting = "carbon_user-avatar-filled"
        static let plusButtonImage = "add-plus"
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
        self.collectionView.register(<#T##cellClass: AnyClass?##AnyClass?#>, forCellWithReuseIdentifier: <#T##String#>)
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
    }
    
    func plusButtunTapped() {
        self.present(NewCardAssembly.build(), animated: true)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }    
}
