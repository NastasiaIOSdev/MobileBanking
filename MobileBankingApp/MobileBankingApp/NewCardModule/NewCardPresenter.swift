//
//  NewCardPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 17.06.2022.
//

import Foundation

protocol INewCardPresenter: AnyObject {
    func viewDidLoad(ui: ICustomNewCardView)
}

final class NewCardPresenter: INewCardPresenter {

// MARK: - Property
    
    weak var ui: ICustomNewCardView?
    private let router: INewCardRouter

// MARK: - Init
    
    init(router: INewCardRouter) {
        self.router = router
    }

// MARK: - viewDidLoad
    
    func viewDidLoad(ui: ICustomNewCardView) {
        self.ui = ui
        self.ui?.dismissButtonTappedActionHandler = { [weak self] in
            guard let self = self else { return }
            self.router.dismissCardView()
        }
        self.ui?.addCardButtonTappedActionHandler = { [weak self] in
            guard let self = self else { return }
            self.router.addAndSaveCardView()
        }
    }
    
    
}
