//
//  BankModelFull.swift
//  Currency
//
//  Created by Petro Golishevskiy on 20.06.2021.
//

import Foundation

//struct BankModelFull {
//    var banks: [Bank]
//}

struct Bank {
    var name: String
    var city: String
    var street: String
    var phone: String
    var supportPhone: String
    var worldSupportPhone: String
    var mail: String
    var imageUrl: String
    var webSite: String
    var internetBanking: String
    var prices: [Prices]
}

struct Prices {
    var USD: ExchangeRate
    var PLN: ExchangeRate
    var EUR: ExchangeRate
    var GBF: ExchangeRate
    var RUR: ExchangeRate
    var CHF: ExchangeRate
}

struct ExchangeRate {
    var purchase: String
    var sale: String
}
