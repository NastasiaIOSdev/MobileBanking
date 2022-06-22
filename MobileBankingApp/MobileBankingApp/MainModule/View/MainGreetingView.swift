//
//  MainGreetingView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import Foundation
import UIKit
import SnapKit

final class  MainGreetingView: UIView {

//MARK: - Settings
    
    struct Settings {
        let image: String
        let greeting: String
        var user: String?
        
        init(image: String, greeting: String, user: String? = nil) {
            self.image = image
            self.greeting = greeting
            self.user = user
        }
    }
    
    private enum Constants {
        static let greetingText = " Здравствуйте, "
        static let usergreetingLabel = "User !"
    }
    
    private enum Constraints {
        static let topBottomInset = 5
    }

// MARK: - Property
    
    private let imageView = UIImageView()
    private let greetingLabel = UILabel()
    private let userLabel = UILabel()

// MARK: - Init
    
    init(settings: Settings) {
        super.init(frame: .zero)
        self.setupUI()
        self.configureView(with: settings)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with setting: Settings) {
        self.imageView.image = UIImage(named: setting.image)
        self.greetingLabel.text = setting.greeting
        self.userLabel.text = setting.user
    }
}

// MARK: - Setup Layout & CommonData

private extension MainGreetingView {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.greetingLabel.font = AppFonts.medium17.font
        self.greetingLabel.text = Constants.greetingText
        self.greetingLabel.textAlignment = .left
        self.greetingLabel.adjustsFontSizeToFitWidth = true
        self.greetingLabel.textColor = .black
        
        self.userLabel.text = Constants.usergreetingLabel
        self.userLabel.textColor = .black
        self.userLabel.textAlignment = .left
        self.userLabel.font = AppFonts.medium17.font
        self.userLabel.adjustsFontSizeToFitWidth = true
        
        self.imageView.tintColor = Colors.redColor.value
    }
    
    func setupLayout() {
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.topBottomInset)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.greetingLabel)
        self.greetingLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.topBottomInset)
            make.leading.equalTo(self.imageView.snp.trailing)
        }
        
        self.addSubview(self.userLabel)
        self.userLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.topBottomInset)
            make.leading.equalTo(self.greetingLabel.snp.trailing)
            make.trailing.equalToSuperview()
        }
    }
}
