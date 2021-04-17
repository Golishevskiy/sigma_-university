//
//  Seller.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

protocol SellDoable {
    func sellSomething()
}

class Seller: Worker, SellDoable {
    func sellSomething() {
        print("\(self.firstName) sold a lot of fish")
    }
}
