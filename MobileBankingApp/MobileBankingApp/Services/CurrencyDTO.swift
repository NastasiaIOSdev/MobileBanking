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
   
    let aud, azn, gbp: Valute?
    var all: [Valute?] {
        [aud, azn, gbp]
    }
    
    enum CodingKeys: String, CodingKey {
        case aud = "AUD"
        case azn = "AZN"
        case gbp = "GBP"
    }
}

struct Valute: Codable {
    let charCode: String
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case charCode = "CharCode"
        case value = "Value"
    }
}
