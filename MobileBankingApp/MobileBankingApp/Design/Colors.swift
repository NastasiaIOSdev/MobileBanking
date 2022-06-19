//
//  Colors.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import Foundation
import UIKit

enum Colors {
    case redColor
    case backgroundGray
    case searchBarGray
    case currencylabel
    case borderButton
    case tabbarLabelOf
    case black
    
    var value: UIColor {
        switch self {
        case .redColor:
            return UIColor(red: 209/255, green: 32/255, blue: 35/255, alpha: 1)
        case .backgroundGray:
            return UIColor(red: 248/255, green: 248/255, blue: 258/255, alpha: 1)
        case .searchBarGray:
            return UIColor(red: 118/255, green: 118/255, blue: 128/255, alpha: 0.012)
        case .currencylabel:
            return UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        case .borderButton:
            return UIColor(red: 226/255, green: 232/255, blue: 240/255, alpha: 1)
        case .tabbarLabelOf:
            return UIColor(red: 170/255, green: 178/255, blue: 191/255, alpha: 1)
        case .black:
            return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
}
