//
//  CustomLoginView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import UIKit
import SnapKit

protocol ICustomLoginView: AnyObject {
    var loginButtonTapped: (() -> Void)? { get set }
}

final class CustomLoginView: UIView, ICustomLoginView {

// MARK: - Properties
    
    var loginButtonTapped: (() -> Void)?
    
    private let logoImageView = UIImageView()
    
    private lazy var loginButton = CustomButtonView(settings: .init(
        labelText: Texts.loginBottonLabelText,
        font: .medium16,
        tapHandler: {
            self.loginButtonTapped?()
        }))

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

private extension CustomLoginView {
    func setupUI() {
        self.logoImageView.image = UIImage(named: Constants.logoImageViewImage)
        
        self.addSubview(self.logoImageView)
        self.logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.logoImageViewHeight)
            make.width.equalTo(Constants.logoImageViewWith)
        }
        
        self.addSubview(self.loginButton)
        self.loginButton.snp.makeConstraints { make in
            make.top.equalTo(self.logoImageView.snp.bottom).offset(Constraints.logoButtonTopOffset)
            make.height.equalTo(Constants.loginBottonHeight)
            make.leading.equalToSuperview().offset(Constraints.logoButtonLeadingOffset)
            make.trailing.equalToSuperview().offset(-Constraints.logoButtonLeadingOffset)
        }
    }
}

// MARK: - Constants, Constraints, Texts

private extension CustomLoginView {
    private enum Constants {
        static let logoImageViewImage = "logo"
        static let logoImageViewHeight = 67
        static let logoImageViewWith = 157
        static let loginBottonHeight = 50
    }
    
    private enum Texts {
        static let loginBottonLabelText = "Войти"
    }
    
    private enum Constraints {
        static let logoButtonLeadingOffset: CGFloat = 16
        static let logoButtonTopOffset: CGFloat = 75
    }
}
