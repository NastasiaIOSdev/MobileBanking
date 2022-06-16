//
//  CurrencyPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit

protocol ICurrencyPresenter: AnyObject {
    func viewDidLoad(ui: ICustomCurrencyView)
}

final class CurrencyPresenter: ICurrencyPresenter {
    weak var ui: ICustomCurrencyView?
    let model: CurrencyModel?
    
    init(model: CurrencyModel) {
        self.model = model
    }

    func viewDidLoad(ui: ICustomCurrencyView) {
        self.ui = ui
        self.ui?.calcButtonTapActionhandler = {
   //         self.present(CalculyatorAssembly.build(), animated: true)
        }
    }
}

