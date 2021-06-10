//
//  Network.swift
//  HW22
//
//  Created by Petro Golishevskiy on 03.06.2021.
//

import Foundation

class Network {
    static let shared = Network()
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    func search(page: String = "1", searchText: String, completion: @escaping ([Item]) -> Void) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.github.com/search/repositories") {
            urlComponents.query = "q=\(searchText)&page=\(page)&per_page=15&sort=stars"
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                } else if
                    let data = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    
                    if let repos = try? JSONDecoder().decode(Repositories.self, from: data) {
                        completion(repos.items)
                    }
                }
            }
        }
        dataTask?.resume()
    }
}
