//
//  Router.swift
//  Currency
//
//  Created by Petro Golishevskiy on 21.06.2021.
//

import Foundation
import UIKit

class Router {
    
    static let shared = Router()
    
    func toSafary(link: String) {
        if let url = URL(string: link) {
            UIApplication.shared.open(url)
        }
    }
    
    func toMap(address: String, navigation: UINavigationController?) {
        let map = UIStoryboard(name: "Main",
                               bundle: nil).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        map.searchName = address
        navigation?.pushViewController(map, animated: true)
    }
    
    func toCall(number: String) {
        if let url = URL(string: "tel://\(number)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
