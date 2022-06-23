//
//  AccountCellModel.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation
import UIKit

struct AccountCellModel {
    var image: UIImage?
    var name: String?
}

var accountDataArray: [AccountCellModel] = [
    AccountCellModel(image: UIImage(named: "carbon_user-avatar-filled"), name: "Личная информация"),
    AccountCellModel(image: UIImage(named: "map"), name: "Банкоматы"),
    AccountCellModel(image: UIImage(named: "clarity_bank-solid"), name: "Операции в офисе"),
    AccountCellModel(image: UIImage(named: "clarity_repeat-line"), name: "Настройка быстрых переводов"),
    AccountCellModel(image: UIImage(named: "bx_bx-support"), name: "Онлайн поддержка"),
    AccountCellModel(image: UIImage(named: "mdi_web"), name: "Сменить язык"),
    AccountCellModel(image: UIImage(named: "wpf_security-checked"), name: "Безопасность"),
    AccountCellModel(image: UIImage(named: "about"), name: "О приложении")
]
