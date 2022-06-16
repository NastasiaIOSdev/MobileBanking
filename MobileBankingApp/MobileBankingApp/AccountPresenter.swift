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

    weak var ui: ICustomAccountView?
    let model: AccountCellModel?
    
    init(model: AccountCellModel) {
        self.model = model
    }
    
    func viewDidLoad(ui: ICustomAccountView) {
        self.ui = ui
        self.ui?.logoutButtonTapActionHandler = {
          //  self.dismiss(animated: true)
        }
    }
}
