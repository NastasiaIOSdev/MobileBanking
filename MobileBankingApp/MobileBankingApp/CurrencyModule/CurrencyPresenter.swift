//
//  CurrencyPresenter.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 16.06.2022.
//

import UIKit

protocol ICurrencyPresenter: AnyObject {
    func viewDidLoad(ui: ICustomCurrencyView, completion: @escaping ([CurrencyModel]) -> Void)
}

final class CurrencyPresenter: ICurrencyPresenter {
    weak var ui: ICustomCurrencyView?
    private var currencies: [CurrencyModel]?
    private var networkservice = NetworkService()
    private var currencyDTOModel: CurrencyDTO?
    private var coreDataManager = CoreDataManager.shared
    
    init() {
        currencies = []
    }
    
    convenience init(_ currencies: [CurrencyModel]) {
        self.init()
        self.currencies = currencies
    }

    func viewDidLoad(ui: ICustomCurrencyView, completion: @escaping ([CurrencyModel]) -> Void) {
        
        self.ui = ui
        self.ui?.calcButtonTapActionhandler = {}
        
        self.fetchDataFromNetworkService {
            guard let currencies = self.currencies else { return }
            completion(currencies)
        }
    }
}

private extension CurrencyPresenter {
    func fetchDataFromNetworkService(completion: @escaping () -> Void) {
        self.networkservice.loadCurrencyData { (result: Result<CurrencyDTO, Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    
                    var newCurrencies = [CurrencyModel]()
                    
                    guard let valutes = model.valutes else { return }
                    for valute in valutes.all {
                        guard let valute = valute else { return }
                        let currency = CurrencyModel(withResponseDataValute: valute)
                        newCurrencies.append(currency)
                    }
                    
                    self.coreDataManager.save(newCurrencies)
                    self.currencies = newCurrencies
                    
                    completion()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                    self.currencies = self.coreDataManager.getValutes()
                }
            }
        }
    }
}
