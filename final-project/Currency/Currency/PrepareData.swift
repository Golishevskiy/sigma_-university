//
//  PrepareData.swift
//  Currency
//
//  Created by Petro Golishevskiy on 20.06.2021.
//

import Foundation

class PrepareData {
    
    static let shared = PrepareData()
    
    var result: Bank?
    
    let dataBanks = ["PrivatBank": BankLocalData(city: "Київ",
                                                 street: "вул. Хрещатик, 22",
                                                 phone: "3700",
                                                 supportPhone: "0739000002",
                                                 worldSupportPhone: "0737161131",
                                                 mail: "pb@privat.ua",
                                                 internetBanking: "Privat24")
    ]
    
    func prepare(bankServer: Exchanger) -> Bank {
        
        let rate = bankServer.rates
        guard let localBank = dataBanks[bankServer.name] else { return convertToBankModel(exchanger: bankServer)  }
        let bank = Bank(name: bankServer.name,
                        city: localBank.city,
                        street: localBank.street,
                        phone: localBank.phone,
                        supportPhone: localBank.supportPhone,
                        worldSupportPhone: localBank.worldSupportPhone,
                        mail: localBank.mail,
                        imageUrl: bankServer.image,
                        webSite: bankServer.website,
                        internetBanking: localBank.internetBanking,
                        prices: [Prices(USD: ExchangeRate(purchase: rate.usd.buy,
                                                          sale: rate.usd.buy),
                                        PLN: ExchangeRate(purchase: rate.pln.buy,
                                                          sale: rate.pln.sel),
                                        EUR: ExchangeRate(purchase: rate.eur.buy,
                                                          sale: rate.eur.sel),
                                        GBF: ExchangeRate(purchase: rate.gbp.buy,
                                                          sale: rate.gbp.sel),
                                        RUR: ExchangeRate(purchase: rate.rur.buy,
                                                          sale: rate.rur.sel),
                                        CHF: ExchangeRate(purchase: rate.chf.buy,
                                                          sale: rate.chf.sel))])
        
        return bank
        
    }
    
    private func convertToBankModel(exchanger: Exchanger) -> Bank {
        let rate = exchanger.rates
        
        let bank = Bank(name: exchanger.name, city: "", street: "", phone: "", supportPhone: "", worldSupportPhone: "", mail: "", imageUrl: exchanger.image, webSite: exchanger.website, internetBanking: "", prices: [Prices(USD: ExchangeRate(purchase: rate.usd.buy,
                                                                                                                                                                                                                                                sale: rate.usd.buy),
                                                                                                                                                                                                                              PLN: ExchangeRate(purchase: rate.pln.buy,
                                                                                                                                                                                                                                                sale: rate.pln.sel),
                                                                                                                                                                                                                              EUR: ExchangeRate(purchase: rate.eur.buy,
                                                                                                                                                                                                                                                sale: rate.eur.sel),
                                                                                                                                                                                                                              GBF: ExchangeRate(purchase: rate.gbp.buy,
                                                                                                                                                                                                                                                sale: rate.gbp.sel),
                                                                                                                                                                                                                              RUR: ExchangeRate(purchase: rate.rur.buy,
                                                                                                                                                                                                                                                sale: rate.rur.sel),
                                                                                                                                                                                                                              CHF: ExchangeRate(purchase: rate.chf.buy,
                                                                                                                                                                                                                                                sale: rate.chf.sel))])
        return bank
        
    }
}

struct BankLocalData {
    var city: String
    var street: String
    var phone: String
    var supportPhone: String
    var worldSupportPhone: String
    var mail: String
    var internetBanking: String
}
