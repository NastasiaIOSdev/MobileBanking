//
//  MainViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

final class MainViewController: UIViewController {
   
    private var ui = CustomMainView()
    private var presenter: IMainPresenter?
    
    // MARK: - Init
    
    init(presenter: IMainPresenter) {
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
        self.presenter?.viewDidload(ui: self.ui)
    }
}
