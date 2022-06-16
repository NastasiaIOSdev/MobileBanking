//
//  CustomCurrencyView.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit

protocol ICustomCurrencyView: AnyObject {
    var calcButtonTapActionhandler: (() -> ())? { get set }
}

final class CustomCurrencyView: UIView, ICustomCurrencyView {
   
    private enum Constants {
        
    }
    
    private enum Texts {
        static let searchBarPlaseholder = "Поиск"
    }
    
    private enum Constraints {
        static let emptyViewWith = 10
    }
    
//MARK: - Property
    
    var calcButtonTapActionhandler: (() -> ())?
    
    private var cell: [CurrencyModel] = currencyDataArray
    
    private lazy var pageLabel = BigLabelButtonView(settings: .init(
        label: "Курсы валют",
        font: .bold34,
        image: "calculator-one",
        color: .black,
        tapHandler: {
            self.calcButtonTapActionhandler?()
        }))

    private let searchTextField = UISearchTextField()
    
    private let currencyDateLabel = CurrencyDateView(settings: .init(
        label: "Курсы на",
        date: ""))
    
    private let tableView = UITableView()
    
    // MARK: - Setup SearchTF
       
       func setupSearchField() {
           self.searchTextField.backgroundColor = Colors.searchBarGray.value
           self.searchTextField.tintColor = .systemGray
           self.searchTextField.layer.masksToBounds = true
           self.searchTextField.attributedPlaceholder = NSAttributedString(
               string: Texts.searchBarPlaseholder,
               attributes: [NSAttributedString.Key.font : AppFonts.regular16.font as Any,
                            NSAttributedString.Key.foregroundColor : Colors.currencylabel.value
                           ]
               )
               let emptyView = UIView(frame: .init(x: .zero, y: .zero, width: Constraints.emptyViewWith, height: .zero))
               self.searchTextField.leftViewMode = .always
               self.searchTextField.leftView = emptyView
               self.searchTextField.rightViewMode = .always
               self.searchTextField.rightView = emptyView
       }
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.backgroundGray.value
        self.setupUI()
        self.setupSearchField()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - SetupUI & Layout

private extension CustomCurrencyView {
    
    func setupUI() {
        self.setupTableView()
        self.setupLayout()
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        self.tableView.backgroundColor = .white
        self.tableView.rowHeight = 68
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
    }
    
    func setupLayout() {
        self.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.pageLabel.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(36)
        }
        
        self.addSubview(self.currencyDateLabel)
        self.currencyDateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.currencyDateLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - TableView DataSource & Delegate

extension CustomCurrencyView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell()}
        cell.cell = currencyDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячека под индексом:\(indexPath.row)")
    }
}


