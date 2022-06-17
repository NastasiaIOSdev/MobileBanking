//
//  MainRouter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 17.06.2022.
//

import Foundation
import UIKit

protocol IMainRouter: AnyObject {
    func openNewCardView()
}

final class  MainRouter {
    weak var vc: UIViewController?
}

extension MainRouter: IMainRouter {
    func openNewCardView() {
        vc?.present(NewCardAssembly.build(), animated: true)
    }
}
