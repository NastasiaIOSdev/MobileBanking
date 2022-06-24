//
//  CustomButtonView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation
import UIKit

final class CustomButtonView: UIView {
 
// MARK: - Settings
    
    struct Settings {
        let labelText: String
        let font: AppFonts
        let tapHandler: () -> Void
    }

// MARK: - Constraints
    
    private enum Constraints {
        static let buttonLabelTopInset: CGFloat = 17
        static let buttonLabelLeadingOffset: CGFloat = 16
    }

// MARK: - Property
    
    private let tapHandler: () -> Void
    private let buttonLabel = UILabel()

// MARK: - Init
    
    init(settings: Settings) {
        self.tapHandler = settings.tapHandler
        super.init(frame: .zero)
        self.setupUI()
        self.configureView(with: settings)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Layout & CommonData

private extension CustomButtonView {
    func setupUI() {
        self.backgroundColor = Colors.redColor.value
        self.buttonLabel.textColor = .white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.buttonLabel.textAlignment = .center
        
        self.addSubview(self.buttonLabel)
        self.buttonLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.buttonLabelTopInset)
            make.leading.equalToSuperview().offset(Constraints.buttonLabelLeadingOffset)
            make.trailing.equalToSuperview().offset(-Constraints.buttonLabelLeadingOffset)
        }
    }
}

// MARK: - Metod convigureView

private extension CustomButtonView {
    func configureView(with settings: Settings) {
        self.buttonLabel.text = settings.labelText
        self.buttonLabel.font = settings.font.font
        
        let gestureRegogniser = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.addGestureRecognizer(gestureRegogniser)
    }
    
    @objc
    func viewTapped() {
        self.tapHandler()
    }
}
