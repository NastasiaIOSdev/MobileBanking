//
//  NetworkService.swift
//  MobileBankingApp
//
//  Created by Анастасия Ларина on 22.06.2022.
//

import Foundation

protocol INetworkManager: AnyObject {
    func loadCurrencyData<T: Decodable>(completion: @escaping (Result<T, Error>)->())
}

final class NetworkManager {
    enum EndPoints {
        static let currencyUrl = "http://www.cbr-xml-daily.ru/daily_json.js"
    }
}

extension NetworkManager: INetworkManager {
    func loadCurrencyData<T: Decodable>(completion: @escaping (Result<T, Error>)->()) {
        guard let url = URL(string: EndPoints.currencyUrl) else { assert(false) }
        let reuqest = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: reuqest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let currencyData = try JSONDecoder().decode(CurrencyDTO.self, from: data)
                completion(.success(currencyData as! T))
            } catch let error {
                completion(.failure(error))
            }
        }
        session.resume()
    }
}
