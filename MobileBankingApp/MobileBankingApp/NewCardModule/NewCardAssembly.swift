//
//  NewCardAssembly.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import UIKit

enum NewCardAssembly {
    static func build() -> NewCardViewController {
        let presenter = NewCardPresenter()
        let vc = NewCardViewController(presenter: presenter)
        return vc
    }
}
