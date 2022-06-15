//
//  CustomButtonView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation
import UIKit

final class CustomButtonView: UIView {
    
    struct Settings {
        let labelText: String
        let font: AppFonts
        let tapHandler: () -> Void
    }
    
    private enum Constants {
        
    }
    
    private enum Constraints {
        
    }
    
    private let tapHandler: () -> Void
    private let buttonLabel = UILabel()
    
    init(settings: Settings) {
        self.tapHandler = settings.tapHandler
        super.init(frame: .zero)
        self.setupUI()
        self.configure(with: settings)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomButtonView {
    func setupUI() {
        self.backgroundColor = Colors.redColor.value
        self.buttonLabel.textColor = .white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.buttonLabel.textAlignment = .center
        
        self.addSubview(self.buttonLabel)
        self.buttonLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(17)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func configure(with settings: Settings) {
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
