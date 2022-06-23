//
//  CoreDataManager.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 22.06.2022.
//

import Foundation
import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
    private func fetch() -> [Currency] {
        (try? context.fetch(Currency.fetchRequest())) ?? []
    }
    
    func save(_ valutes: [CurrencyModel]) {
        valutes.forEach { valute in
            let currency = Currency(context: context)
            currency.value = Double(valute.value ?? "") ?? 0
            currency.name = valute.name
            currency.code = valute.charCode
        }
        appDelegate.saveContext()
    }
    
    func getValutes() -> [CurrencyModel] {
        fetch().map({CurrencyModel(code: $0.code ?? "",name: $0.name ?? "", value: String($0.value))})
    }
}
