//
//  CardCollectionViewCell.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit
import SnapKit

final class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionViewCell"
    
    private enum Constants {
        static let nameImageView = "card"
    }
    
    private enum Constraints {
        static let imageTopInset: CGFloat = 27
        static let imageBottomInset: CGFloat = 29
        static let imageLeadingInset: CGFloat = 48
        static let imageTrailingInset: CGFloat = 43
    }
    
    private let cellView = UIView()
    private let imageView = UIImageView()
    private let cardView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupUI()
    }
}

private extension CardCollectionViewCell {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.cellView.translatesAutoresizingMaskIntoConstraints = false
        
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageView.image = UIImage(named: Constants.nameImageView)
        
        self.cardView.backgroundColor = .purple
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
