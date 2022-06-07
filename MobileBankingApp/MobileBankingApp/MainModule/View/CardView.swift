//
//  CardView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit
import SnapKit

final class  CardView: UIView {
    
    private enum Constants {
        
    }
    
    private enum Constraints {
        
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
    
    private let cellView = UIView()
    private let cardLabel = UILabel()
    private let expDateLabel = UILabel()
    private let expDateNumLabel = UILabel()
    private let typeCardImage = UIImageView()
    private let avBalanceLabel = UILabel()
    private let balanceLabel = UILabel()
    
    init(settings: Settings) {
        super.init(frame: .zero)
        
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

private extension CardView {
    
}
