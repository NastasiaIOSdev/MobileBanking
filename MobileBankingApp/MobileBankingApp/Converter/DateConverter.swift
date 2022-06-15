//
//  DateConverter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 15.06.2022.
//

import Foundation

enum DateConverter {
   static func getCurrentDate() -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.dateFormat = "dd.MM.yyyy"
        let date = dateFormater.string(from: NSDate() as Date)
        return date
    }
}
