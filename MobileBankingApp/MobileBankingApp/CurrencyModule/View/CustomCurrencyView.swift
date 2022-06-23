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
  
    //MARK: - Property
    
    var calcButtonTapActionhandler: (() -> ())?
    
    var currencies = [CurrencyModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    var filteredCurrencies = [CurrencyModel]()
    
    var searching = false
    
    private lazy var pageLabel = BigLabelButtonView(settings: .init(
        label: Texts.pageLabelText,
        font: .bold34,
        image: Constants.pageLabelImage,
        color: .black,
        tapHandler: {
            self.calcButtonTapActionhandler?()
        }))
    
    private lazy var searchTextField = UISearchTextField()
    
    private let currencyDateLabel = CurrencyDateView(settings: .init(
        label: Texts.currencyDateLabelText,
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
        let emptyView = UIView(frame: .init(x: .zero, y: .zero, width: Constants.emptyViewWith, height: .zero))
        self.searchTextField.leftViewMode = .always
        self.searchTextField.leftView = emptyView
        self.searchTextField.rightViewMode = .always
        self.searchTextField.rightView = emptyView
    }
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = Colors.backgroundGray.value
        self.setupUI()
        self.setupSearchField()
        searchTextField.delegate = self
        self.searchTextField.addTarget(self, action: #selector(self.searchValute), for: .editingChanged)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func searchValute() {
        
        self.filteredCurrencies.removeAll()
        
        guard let toSearch = searchTextField.text else { return }
        
        searching = toSearch.count != 0
        
        filteredCurrencies = searching ?
        currencies.filter({ ($0.name ?? "").lowercased().contains(toSearch.lowercased()) || ($0.charCode ?? "").lowercased().contains(toSearch.lowercased()) }) : currencies
        
        tableView.reloadData()
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
        self.tableView.separatorInset = Constants.tableViewSeparatorInsert
        self.tableView.backgroundColor = .white
        self.tableView.rowHeight = Constants.tableViewRowHeight
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
    }
    
    func setupLayout() {
        self.addSubview(self.pageLabel)
        self.pageLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview().inset(Constraints.pageLabelLeadingInset)
        }
        
        self.addSubview(self.searchTextField)
        self.searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.pageLabel.snp.bottom).offset(Constraints.searchTextFieldTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.searchTextFieldLeadingInset)
            make.height.equalTo(Constants.searchTextFieldHeight)
        }
        
        self.addSubview(self.currencyDateLabel)
        self.currencyDateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.searchTextField.snp.bottom).offset(Constraints.currencyDateLabelTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constraints.currencyDateLabelLeadingInset)
        }
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.currencyDateLabel.snp.bottom).offset(Constraints.tableViewTopOffset)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

// MARK: - TableView DataSource & Delegate

extension CustomCurrencyView: UITableViewDataSource, UITableViewDelegate {
    
    var actualCurrencies: [CurrencyModel] {
        searching ? filteredCurrencies : currencies
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        actualCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell()}
        cell.model = actualCurrencies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Нажата ячека под индексом:\(indexPath.row)")
    }
}

// MARK: - UITextFieldDelegate

extension CustomCurrencyView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return false
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("tf:", textField.text ?? "")
        searchTextField.resignFirstResponder()
        return true
    }*/
}

// MARK: - Constants, Texts, Constrants

private extension CustomCurrencyView {
   
    private enum Constants {
        static let pageLabelImage = "calculator-one"
        static let tableViewSeparatorInsert = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        static let tableViewRowHeight: CGFloat = 68
        static let emptyViewWith = 10
        static let searchTextFieldHeight: CGFloat = 36
    }
    
    private enum Texts {
        static let searchBarPlaseholder = "Поиск"
        static let pageLabelText = "Курсы валют"
        static let currencyDateLabelText = "Курсы на"
        
    }
    
    private enum Constraints {
        static let pageLabelLeadingInset: CGFloat = 16
        static let searchTextFieldTopOffset: CGFloat = 15
        static let searchTextFieldLeadingInset: CGFloat = 16
        static let currencyDateLabelTopOffset: CGFloat = 20
        static let currencyDateLabelLeadingInset: CGFloat = 16
        static let tableViewTopOffset: CGFloat = 10
    }
}
