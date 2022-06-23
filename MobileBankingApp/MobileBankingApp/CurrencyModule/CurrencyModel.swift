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
    var name: String?
    var value: String?
    
    init(code: String, name: String, value: String) {
        self.charCode = code
        self.name = name
        self.value = value
    }
    
    init(withResponseDataValute valute: Valute) {
        self.charCode = valute.charCode
        self.name = valute.name
        self.value = String(format: "%.2f", valute.value) 
    }
}
