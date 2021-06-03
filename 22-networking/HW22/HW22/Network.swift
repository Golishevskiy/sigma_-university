//
//  Network.swift
//  HW22
//
//  Created by Petro Golishevskiy on 03.06.2021.
//

import Foundation

class Network {
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func search(page: String, searchText: String, completion: @escaping ([Item]) -> Void) {
        dataTask?.cancel()
        if var urlComponents = URLComponents(string: "https://api.github.com/search/repositories") {
            urlComponents.query = "q=\(searchText)&sort=desc&page=\(page)&per_page=10"
            guard let url = urlComponents.url else { return }
            
            dataTask =
               defaultSession.dataTask(with: url) { [weak self] data, response, error in
               defer {
                 self?.dataTask = nil
               }
               // 5
               if let error = error {
                 print(error)
               } else if
                 let data = data,
                 let response = response as? HTTPURLResponse,
                 response.statusCode == 200 {

                    if let repos = try? JSONDecoder().decode(Welcome.self, from: data) {
                        print(repos.items)
                        completion(repos.items)
                    }

               }
             }
        }
        dataTask?.resume()
        
    }
}
