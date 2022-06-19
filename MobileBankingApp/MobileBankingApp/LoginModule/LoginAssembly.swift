//
//  LoginAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import UIKit

enum  LoginAssembly {
    static func build() -> LoginViewController {
        let router = LoginRouter()
        let presenter = LoginPresenter(router: router)
        let vc = LoginViewController(presenter: presenter)
        router.vc = vc
        return vc
    }
}
