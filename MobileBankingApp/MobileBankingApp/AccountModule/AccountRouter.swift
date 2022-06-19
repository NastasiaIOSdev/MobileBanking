//
//  AccountRouter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import Foundation
import UIKit

protocol IAccountRouter: AnyObject {
    func logoutButtonTap()
}

final class AccountRouter {
    weak var vc: UIViewController?
}
extension AccountRouter: IAccountRouter {
    func logoutButtonTap() {
        vc?.dismiss(animated: true)
    }
}
