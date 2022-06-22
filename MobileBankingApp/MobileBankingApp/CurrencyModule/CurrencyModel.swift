//
//  CurrencyModel.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation
import UIKit

struct CurrencyModel {
    //var imageFlag: UIImage?
    var charCode: String?
    //var name: String?
    var value: String?
    
    init(code: String, value: String) {
        self.charCode = code
        self.value = value
    }
    
    init(withResponseDataValute valute: Valute) {
        self.charCode = valute.charCode
        self.value = String(format: "%.2f", valute.value) 
    }
}

//var currencyDataArray: [CurrencyModel] = [
//    CurrencyModel(imageFlag: UIImage(named: "EUR"), charCode: "EUR", name: "евро", value: "44"),
//    CurrencyModel(imageFlag: UIImage(named: "EUR"), charCode: "USD", name: "доллар", value: "44"),
//    CurrencyModel(imageFlag: UIImage(named: "EUR"), charCode: "CNY", name: "юань", value: "44"),
//    CurrencyModel(imageFlag: UIImage(named: "EUR"), charCode: "CAD", name: "кан.доллар", value: "22")
//]
