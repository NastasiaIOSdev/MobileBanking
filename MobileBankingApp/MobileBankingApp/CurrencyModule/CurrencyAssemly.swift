//
//  CurrencyAssemly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum CurrencyAssemly {
    static func build() -> CurrencyViewController {
        let presenter = CurrencyPresenter()
        let vc = CurrencyViewController(presenter: presenter)
        return vc
    }
}
