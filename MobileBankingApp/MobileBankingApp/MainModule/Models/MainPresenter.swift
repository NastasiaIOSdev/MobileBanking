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
    let model: PaymentsCellModel?
    
    init(model: PaymentsCellModel) {
        self.model = model
    }
    
    func viewDidload(ui: ICustomMainView) {
        self.ui = ui
        self.ui?.plusButtunTappedActionHandler = {
           // self.present(NewCardAssembly.build(), animated: true)
        }
    }
}
