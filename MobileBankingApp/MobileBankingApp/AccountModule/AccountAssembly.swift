//
//  AccountAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum AccountAssembly {
    static func biuld() -> AccountViewController {
        let presenter = AccountPresenter(model: AccountCellModel())
        let vc = AccountViewController(presenter: presenter)
        return vc
    }
}
