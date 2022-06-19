//
//  LoginRouter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import Foundation
import UIKit

protocol ILoginRouter: AnyObject {
    func openMainView()
}

final class LoginRouter {
    weak var vc: UIViewController?
}

extension LoginRouter: ILoginRouter {
    func openMainView() {
        let vc = TabbarAssembly.build()
        vc.modalPresentationStyle = .fullScreen
        self.vc?.present(vc, animated: true)
    }
}

//        let vc = TabbarAssembly.build()
//        vc.modalPresentationStyle = .fullScreen
//        self.present(vc, animated: true)
