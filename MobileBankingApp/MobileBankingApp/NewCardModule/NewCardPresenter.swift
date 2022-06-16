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
    
    weak var ui: ICustomNewCardView?
    
    init() {
        
    }
    
    func viewDidLoad(ui: ICustomNewCardView) {
        self.ui = ui
        self.ui?.dismissButtonTappedActionHandler = {
            //self.dismiss(animated: true)
        }
        self.ui?.addCardButtonTappedActionHandler = {
           //self.dismiss(animated: true)
        }
    }
    
    
}
