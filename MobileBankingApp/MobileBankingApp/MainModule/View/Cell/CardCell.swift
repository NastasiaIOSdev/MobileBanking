//
//  CardCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class CardCell: UICollectionViewCell {
    
    static let identifier = "CardCell"
    
    private enum Constants {
        static let itemsPerRow: CGFloat = 1
        static let sectionsInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        static let minSpacing: CGFloat = 0
        static let numberOfItemsInSection = 3
    }
    
// MARK: - Property
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.minSpacing
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(
            CardCollectionViewCell.self,
            forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CardCell {
    func setupLayout() {
        self.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - CollectionView DelegateFlowLayout

extension CardCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height)
    }
}

// MARK: - CollectionView DataSource & Delegate

extension CardCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CardCollectionViewCell.identifier,
            for: indexPath)
        return cell
    }
}
