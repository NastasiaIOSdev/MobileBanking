//
//  LoginViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import UIKit

class LoginViewController: UIViewController {

    private var ui = CustomLoginView()
    private var presenter: ILoginPresenter?
    
    init(presenter: ILoginPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = self.ui
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad(ui: self.ui)
       
    }
}
