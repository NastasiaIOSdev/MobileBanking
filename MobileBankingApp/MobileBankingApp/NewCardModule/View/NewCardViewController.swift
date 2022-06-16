//
//  NewCardViewController.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

class NewCardViewController: UIViewController {
    
    private var ui = CustomNewCardView()
    private var presenter: INewCardPresenter?
    
    // MARK: - Init
    
    init(presenter: INewCardPresenter) {
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
        self.presenter?.viewDidLoad(ui: self.ui)
    }
}
