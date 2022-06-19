//
//  NewCardRouter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 19.06.2022.
//

import Foundation
import UIKit

protocol INewCardRouter: AnyObject {
    func dismissCardView()
    func addAndSaveCardView()
}

final class NewCardRouter {
    weak var vc: UIViewController?
}

extension NewCardRouter: INewCardRouter {
    func dismissCardView() {
        vc?.dismiss(animated: true)
    }
    
    func addAndSaveCardView() {
        vc?.dismiss(animated: true)
    }
}
