//
//  BankModel.swift
//  Currency
//
//  Created by Petro Golishevskiy on 16.06.2021.
//

import Foundation

struct BankModel: Codable {
    let serviceID, serviceName: String
    let exchangers: [Exchanger]

    enum CodingKeys: String, CodingKey {
        case serviceID = "serviceId"
        case serviceName, exchangers
    }
}

struct Exchanger: Codable {
    let id, serviceID, name: String
    let website: String
    let image: String
    let background, border, slug: String
    let rates: Rates

    enum CodingKeys: String, CodingKey {
        case id
        case serviceID = "serviceId"
        case name, website, image, background, border, slug, rates
    }
}

struct Rates: Codable {
    let exchangerID: String
    let updateTime: Int
    let usd, eur, rur, gbp: Chf
    let chf, pln: Chf

    enum CodingKeys: String, CodingKey {
        case exchangerID = "exchangerId"
        case updateTime, usd, eur, rur, gbp, chf, pln
    }
}

struct Chf: Codable {
    let buy, sel: String
}
