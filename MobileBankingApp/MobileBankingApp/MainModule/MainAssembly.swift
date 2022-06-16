//
//  MainAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum MainAssembly {
    static func build() -> MainViewController {
        let presenter = MainPresenter(model: PaymentsCellModel(image: "", name: ""))
        let vc = MainViewController(presenter: presenter)
        return vc
    }
}
