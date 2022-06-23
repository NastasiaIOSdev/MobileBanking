//
//  CurrencyDTO.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 22.06.2022.
//

import Foundation

struct CurrencyDTO: Codable {
    
    let valutes: Valutes?
    
    enum CodingKeys: String, CodingKey {
        case valutes = "Valute"
    }
}

struct Valutes: Codable {
   
    let usd, eur, cad, dkk, nok, chf, cny, jpy, sek, sgd: Valute?
    var all: [Valute?] {
        [usd, eur, cad, dkk, nok, chf, cny, jpy, sek, sgd]
    }
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case eur = "EUR"
        case cad = "CAD"
        case dkk = "DKK"
        case nok = "NOK"
        case chf = "CHF"
        case cny = "CNY"
        case jpy = "JPY"
        case sek = "SEK"
        case sgd = "SGD"
    }
}

struct Valute: Codable {
    let charCode: String
    let name: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case name = "Name"
        case value = "Value"
    }
}
