//
//  AccountPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import Foundation

protocol IAccountPresenter: AnyObject {
    func viewDidLoad(ui: ICustomAccountView)
}

final class AccountPresenter: IAccountPresenter {

//MARK: - Property
    
    weak var ui: ICustomAccountView?
    var model: AccountCellModel?
    private let router: IAccountRouter

//MARK: - Init
    
    init(router: IAccountRouter) {
        self.router = router
    }

//MARK: - viewDidLoad
    
    func viewDidLoad(ui: ICustomAccountView) {
        self.ui = ui
        self.ui?.logoutButtonTapActionHandler = { [weak self] in
            guard let self = self else { return }
            self.router.logoutButtonTap()
        }
    }
}
