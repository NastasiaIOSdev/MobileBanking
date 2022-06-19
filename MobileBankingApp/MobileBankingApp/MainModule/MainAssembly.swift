//
//  MainAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum MainAssembly {
    static func build() -> MainViewController {
        let router = MainRouter()
        let presenter = MainPresenter(router: router)
        presenter.model = PaymentsCellModel(image: "", name: "")
        let vc = MainViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
