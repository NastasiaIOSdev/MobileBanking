//
//  AccountViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class AccountViewController: UIViewController {

// MARK: - Property
    
    private var presenter: IAccountPresenter?
    private var ui = CustomAccountView()
    
// MARK: - Init
    
    init(presenter: IAccountPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

// MARK: - loadView
    
    override func loadView() {
        self.view = self.ui
    }
    
// MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad(ui: self.ui)
    }
}
