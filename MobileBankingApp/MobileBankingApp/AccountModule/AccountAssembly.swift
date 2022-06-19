//
//  AccountAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum AccountAssembly {
    static func biuld() -> AccountViewController {
        let router = AccountRouter()
        let presenter = AccountPresenter(router: router)
        presenter.model = AccountCellModel(image: UIImage(named: ""), name: "")
        let vc = AccountViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
