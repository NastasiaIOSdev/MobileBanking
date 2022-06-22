//
//  Currency+CoreDataProperties.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 22.06.2022.
//
//

import Foundation
import CoreData


extension Currency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currency> {
        return NSFetchRequest<Currency>(entityName: "Currency")
    }

    @NSManaged public var value: Double
    @NSManaged public var code: String?

}

extension Currency : Identifiable {

}
