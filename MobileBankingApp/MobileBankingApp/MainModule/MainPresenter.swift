//
//  MainPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import Foundation

protocol IMainPresenter: AnyObject {
    func viewDidload(ui: ICustomMainView)
}

final class MainPresenter: IMainPresenter {
    
    weak var ui: ICustomMainView?
    var model: PaymentsCellModel?
    private let router: IMainRouter
    
    init(router: IMainRouter) {
        self.router = router
    }
    
    func viewDidload(ui: ICustomMainView) {
        self.ui = ui
        self.ui?.plusButtunTappedActionHandler = { [weak self] in
            guard let self = self else { return }
            self.router.openNewCardView()
        }
    }
}
