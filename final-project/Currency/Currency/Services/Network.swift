//
//  Network.swift
//  Currency
//
//  Created by Petro Golishevskiy on 16.06.2021.
//

import Foundation

class Network {
    static let shared = Network()
    
    func getData(completion: @escaping ([Exchanger]) -> Void) {
        let session = URLSession(configuration: .default)
        guard let url = URL(string: "https://kurstoday.com.ua/api/service/banks-of-ukraine") else { return }
        
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                let response = try? JSONDecoder().decode(BankModel.self, from: data)
                guard let exchangers = response?.exchangers else { return }
                DispatchQueue.main.async {
                    completion(exchangers)
                }
            }
        }.resume()
    }
}

