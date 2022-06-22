//
//  CurrencyViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class CurrencyViewController: UIViewController {

    private var ui = CustomCurrencyView()
    private var presenter: ICurrencyPresenter?
    
// MARK: - Init
    
    init(presenter: ICurrencyPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.ui
    }
    
// MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter?.viewDidLoad(ui: self.ui) { currencies in
            self.ui.currencies = currencies
        }
    }
}



