//
//  PaymentsCellModel.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import Foundation
import UIKit

struct  PaymentsCellModel {
    var image: String
    var name: String
}

var paymentsDataArray: [PaymentsCellModel] = [
    PaymentsCellModel(image: "phone", name: "Мобильные операторы"),
    PaymentsCellModel(image: "clarity_bank-solid", name: "Кошельки и банки"),
    PaymentsCellModel(image: "si-glyph_pin-location-map", name: "Место оплаты"),
    PaymentsCellModel(image: "balloon", name: "Коммунальные услуги"),
    PaymentsCellModel(image: "mdi_web", name: "Интернет и ТВ"),
    PaymentsCellModel(image: "percent", name: "Налоги"),
    PaymentsCellModel(image: "ic_sharp-delivery-dining", name: "Доставка"),
    PaymentsCellModel(image: "clarity_shopping-bag-solid", name: "Досуг"),
    PaymentsCellModel(image: "libra", name: "Министерство юстиции"),
    PaymentsCellModel(image: "clarity_shopping-bag-solid", name: "Магазины"),
    PaymentsCellModel(image: "ion_game-controller-sharp", name: "Соцсети и онлайн-игры"),
    PaymentsCellModel(image: "study", name: "Образование"),
]
