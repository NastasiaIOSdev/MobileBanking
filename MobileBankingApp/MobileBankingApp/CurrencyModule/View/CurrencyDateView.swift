//
//  CurrencyDateView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import UIKit
import SnapKit

final class CurrencyDateView: UIView {
    
    struct Settings {
        let label: String
        let date: String
    }
    
// MARK: - Property
    
    private enum Constraint {
        static let dateLabelLeadingOffset: CGFloat = 5
    }
    private let currencyLabel = UILabel()
    private let dateLabel = UILabel()

// MARK: - Init
    
    init(settings: Settings) {
        super.init(frame: .zero)
        self.configureView(with: settings)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup CommonData & LAyout, Metod configureView

private extension CurrencyDateView {
    func configureView(with settings: Settings) {
        self.currencyLabel.text = settings.label
        self.dateLabel.text = settings.date
    }
    
    func setupUI() {
        self.currencyLabel.font = AppFonts.medium17.font
        self.currencyLabel.textColor = .gray
        self.currencyLabel.textAlignment = .left
        
        self.dateLabel.text = DateConverter.getCurrentDate()
        self.dateLabel.font = AppFonts.medium17.font
        self.dateLabel.textColor = .gray
        self.dateLabel.textAlignment = .left
        
        
        self.addSubview(self.currencyLabel)
        self.currencyLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.dateLabel)
        self.dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(self.currencyLabel.snp.trailing).offset(Constraint.dateLabelLeadingOffset)
        }
    }
}
