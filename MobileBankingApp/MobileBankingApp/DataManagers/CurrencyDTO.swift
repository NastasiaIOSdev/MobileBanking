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
   
    let eur, chf, usd, cad, bgn, byn, pln, ron, brl : Valute?
    var all: [Valute?] {
        [eur, chf, usd, cad, bgn, byn, pln, ron, brl]
    }
    
    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
        case chf = "CHF"
        case usd = "USD"
        case cad = "CAD"
        case bgn = "BGN"
        case byn = "BYN"
        case pln = "PLN"
        case ron = "RON"
        case brl = "BRL"
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
