//
//  NewCardAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum NewCardAssembly {
    static func build() -> NewCardViewController {
        let router = NewCardRouter()
        let presenter = NewCardPresenter(router: router)
        let vc = NewCardViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
