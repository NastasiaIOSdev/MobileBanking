//
//  LoginPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import Foundation

protocol ILoginPresenter: AnyObject {
    func viewDidLoad(ui: ICustomLoginView)
}

final class LoginPresenter: ILoginPresenter {
   
    weak var ui: ICustomLoginView?
    private let router: ILoginRouter
    
    init(router: ILoginRouter) {
        self.router = router
    }
    
    func viewDidLoad(ui: ICustomLoginView) {
        self.ui = ui
        self.ui?.loginButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.router.openMainView()
        }
    }
    
}
