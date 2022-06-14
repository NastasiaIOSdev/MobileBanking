//
//  AppFonts.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 07.06.2022.
//

import Foundation
import UIKit

enum AppFonts {
    case light14
    case regular14
    case regular15
    case regular16
    case regular17
    case medium14
    case medium16
    case medium17
    case medium18
    case medium20
    case bold22
    case bold34
    case semibold12
    case semibold22
    
    var font: UIFont? {
        switch self {
        case .light14:
            return UIFont(name: "Inter-Light", size: 14)
        case .regular14:
            return UIFont(name: "Inter-Regular", size: 14)
        case .regular15:
            return UIFont(name: "Inter-Regular", size: 15)
        case .regular16:
            return UIFont(name: "Inter-Regular", size: 16)
        case .regular17:
            return UIFont(name: "Inter-Regular", size: 17)
        case .medium14:
            return UIFont(name: "Inter-Medium", size: 14)
        case .medium16:
            return UIFont(name: "Inter-Medium", size: 16)
        case .medium17:
            return UIFont(name: "Inter-Medium", size: 17)
        case .medium18:
            return UIFont(name: "Inter-Medium", size: 18)
        case .medium20:
            return UIFont(name: "Inter-Medium", size: 20)
        case .bold22:
            return UIFont(name: "Inter-Bold", size: 22)
        case .bold34:
            return UIFont(name: "Inter-Bold", size: 34)
        case .semibold12:
            return UIFont(name: "Inter-SemiBold", size: 12)
        case .semibold22:
            return UIFont(name: "Inter-SemiBold", size: 21)
        }
    }
}
