//
//  OwnerCardTextFieldView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import UIKit
import SnapKit

class  OwnerCardTextFieldView: UIView {

    struct Setting {
        let header: String
        let value: String?
        
        init(header: String, value: String? = nil) {
            self.header = header
            self.value = value
        }
    }
// MARK: - Constraints, Constant
    
    private enum Constants {
        
        static let textFieldCornerRadius: CGFloat = 10
        static let textFieldEmptyViewWith = 16
        static let textFieldHeight = 54
    }
    
    private enum Constraints {
        static let textfieldTopOffset = 8
    }
    
    private enum Texts {
        static let textFieldPlaceHolderText = "Ivanov Ivan"
    }

// MARK: - Property
    
    public var text: String? {
        get {
            return self.textField.text
        }
        set {
            self.textField.text = newValue
        }
    }
    
    public var delegate: UITextFieldDelegate? {
        get {
            return nil
        }
        set {
            self.textField.delegate = newValue
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium14.font
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(
            string: Texts.textFieldPlaceHolderText,
            attributes: [
                NSAttributedString.Key.font: AppFonts.regular17.font as Any,
                NSAttributedString.Key.foregroundColor: Colors.tabbarLabelOf.value
                        ])
        textField.backgroundColor = Colors.backgroundGray.value
        textField.layer.cornerRadius = Constants.textFieldCornerRadius
        let emptyView = UIView(frame: .init(
            x: .zero,
            y: .zero,
            width: Constants.textFieldEmptyViewWith,
            height: .zero)
        )
        textField.leftViewMode = .always
        textField.leftView = emptyView
        textField.rightViewMode = .always
        textField.rightView = emptyView
        return textField
    }()
    
// MARK: - Init
    
    init(settings: Setting) {
        super.init(frame: .zero)
        self.setupUI()
        self.configureView(with: settings)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup TextField

private extension OwnerCardTextFieldView {
    func configureView(with settings: Setting) {
        self.label.text = settings.header
        self.textField.text = settings.value
    }
    
    func setupUI() {
        self.addSubview(self.label)
        self.label.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        self.addSubview(self.textField)
        self.textField.snp.makeConstraints { make in
            make.top.equalTo(self.label.snp.bottom).offset(Constraints.textfieldTopOffset)
            make.height.equalTo(Constants.textFieldHeight)
            make.leading.trailing.bottom.equalToSuperview()
            
        }
    }
}
