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

//MARK: - Property
    
    var model: PaymentsCellModel?
    
    weak var ui: ICustomMainView?
    
    private let router: IMainRouter

//MARK: - Init
    
    init(router: IMainRouter) {
        self.router = router
    }

//MARK: - Life cycles
    
    func viewDidload(ui: ICustomMainView) {
        self.ui = ui
        self.ui?.plusButtunTappedActionHandler = { [weak self] in
            guard let self = self else { return }
            self.router.openNewCardView()
        }
    }
}
