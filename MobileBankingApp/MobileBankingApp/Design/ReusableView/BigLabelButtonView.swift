//
//  BigLabelButtonView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit
import SnapKit

class BigLabelButtonView: UIView {
    struct Setting {
        let label: String
        let font: AppFonts
        let image: String
        let color: Colors
        let tapHandler: () -> Void
    }
    
    private enum Constraints {
       static let imageInsert = 10
       static let imageHeight = 24
    }
    
    private let imageView = UIImageView()
    private let pageMainLabel = UILabel()
    private let tapHandler: () -> Void
    
    init(settings: Setting) {
        self.tapHandler = settings.tapHandler
        super.init(frame: .zero)
        self.setupUI()
        self.configureView(with: settings)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(with settings: Setting) {
        self.imageView.image = UIImage(named: settings.image)
        self.imageView.tintColor = settings.color.value
        self.pageMainLabel.text = settings.label
        self.pageMainLabel.font = settings.font.font
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc
    func viewTapped() {
        self.tapHandler()
    }
}

private extension BigLabelButtonView {
    func setupUI() {
        self.setupCommonData()
        self.setupLayout()
    }
    
    func setupCommonData() {
        self.imageView.tintColor = Colors.redColor.value
        
        self.pageMainLabel.text = ""
        self.pageMainLabel.font = AppFonts.bold34.font
        self.pageMainLabel.textColor = .black
        self.pageMainLabel.textAlignment = .left
    }
    
    func setupLayout() {
        self.addSubview(self.pageMainLabel)
        self.pageMainLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.height.equalToSuperview().priority(.high)
            make.leading.equalToSuperview()
        }
        
        self.addSubview(self.imageView)
        self.imageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constraints.imageInsert)
            make.centerX.equalTo(self.pageMainLabel.snp.centerX)
            make.height.equalTo(Constraints.imageHeight).priority(.high)
            make.width.equalTo(Constraints.imageHeight)
            make.trailing.equalToSuperview()
        }
    }
}
