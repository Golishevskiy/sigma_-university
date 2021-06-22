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
                                                 internetBanking: "Privat24"),
                     "National Bank": BankLocalData(city: "Житомир",
                                                    street: "вул. Київська, 60",
                                                    phone: "08001009090",
                                                    supportPhone: "0739000002",
                                                    worldSupportPhone: "0737161131",
                                                    mail: "pb@privat.ua",
                                                    internetBanking: "Privat24"),
                     "UKRSIBBANK": BankLocalData(city: "Київ",
                                                 street: "вул. Шолуденка, 1",
                                                 phone: "08005000990",
                                                 supportPhone: "0739000002",
                                                 worldSupportPhone: "0737161131",
                                                 mail: "pb@privat.ua",
                                                 internetBanking: "Privat24"),
                     "OTP bank": BankLocalData(city: "Чернігів",
                                               street: "вул. Громадська, 45",
                                               phone: "08005006070",
                                               supportPhone: "0739000002",
                                               worldSupportPhone: "0737161131",
                                               mail: "pb@privat.ua",
                                               internetBanking: "Privat24"),
                     "Oschad Bank": BankLocalData(city: "Львів",
                                                  street: "вул. Шопена, 3",
                                                  phone: "08008888888",
                                                  supportPhone: "0739000002",
                                                  worldSupportPhone: "0737161131",
                                                  mail: "pb@privat.ua",
                                                  internetBanking: "Privat24"),
                     "IdeaBank": BankLocalData(city: "Львів",
                                               street: "вул. Варшавська, 7",
                                               phone: "080044440000",
                                               supportPhone: "0739000002",
                                               worldSupportPhone: "0737161131",
                                               mail: "pb@privat.ua",
                                               internetBanking: "Privat24"),
                     "Bank Aval": BankLocalData(city: "Херсон",
                                                street: "вул. Некрасова, 77",
                                                phone: "08004005040",
                                                supportPhone: "0739000002",
                                                worldSupportPhone: "0737161131",
                                                mail: "pb@privat.ua",
                                                internetBanking: "Privat24"),
                     "KredoBank": BankLocalData(city: "Полтава",
                                                street: "вул. Пушкіна, 109",
                                                phone: "08003050030",
                                                supportPhone: "0739000002",
                                                worldSupportPhone: "0737161131",
                                                mail: "pb@privat.ua",
                                                internetBanking: "Privat24"),
                     "Банк Південний": BankLocalData(city: "Київ",
                                                                  street: "вул. Львівська, 22",
                                                                  phone: "08004005050",
                                                                  supportPhone: "0739000002",
                                                                  worldSupportPhone: "0737161131",
                                                                  mail: "pb@privat.ua",
                                                                  internetBanking: "Privat24"),
                     "Universal Bank": BankLocalData(city: "Полтава",
                                                     street: "вул. Харчовиків, 30",
                                                     phone: "08008008081",
                                                     supportPhone: "0739000002",
                                                     worldSupportPhone: "0737161131",
                                                     mail: "pb@privat.ua",
                                                     internetBanking: "Privat24"),
                     "Alfa-Bank": BankLocalData(city: "Черкаси",
                                                street: "вул. Університетська, 47",
                                                phone: "08001004040",
                                                supportPhone: "0739000002",
                                                worldSupportPhone: "0737161131",
                                                mail: "pb@privat.ua",
                                                internetBanking: "Privat24"),
                     "Укргазбанк": BankLocalData(city: "Дніпро",
                                                           street: "вул. Благовісна, 86",
                                                           phone: "08005050500",
                                                           supportPhone: "0739000002",
                                                           worldSupportPhone: "0737161131",
                                                           mail: "pb@privat.ua",
                                                           internetBanking: "Privat24"),
                     "ПУМБ": BankLocalData(city: "Харків",
                                               street: "вул. Конєва, 8",
                                               phone: "08005001000",
                                               supportPhone: "0739000002",
                                               worldSupportPhone: "0737161131",
                                               mail: "pb@privat.ua",
                                               internetBanking: "Privat24"),
                     "Monobank": BankLocalData(city: "Черкаси",
                                               street: "вул. Василини, 45",
                                               phone: "0886001010",
                                               supportPhone: "0739000002",
                                               worldSupportPhone: "0737161131",
                                               mail: "pb@privat.ua",
                                               internetBanking: "Privat24"),
                     "Privat24": BankLocalData(city: "Київ",
                                               street: "вул. Борщагівська, 124",
                                               phone: "08008000808",
                                               supportPhone: "0739000002",
                                               worldSupportPhone: "0737161131",
                                               mail: "pb@privat.ua",
                                               internetBanking: "Privat24"),
                     "Bank Lviv": BankLocalData(city: "Львів",
                                                street: "вул. Зелена, 212",
                                                phone: "0442221101",
                                                supportPhone: "0739000002",
                                                worldSupportPhone: "0737161131",
                                                mail: "pb@privat.ua",
                                                internetBanking: "Privat24"),
                     "Bisbank": BankLocalData(city: "Запоріжжя",
                                              street: "вул. Патріотична, 36А",
                                              phone: "08005001020",
                                              supportPhone: "0739000002",
                                              worldSupportPhone: "0737161131",
                                              mail: "pb@privat.ua",
                                              internetBanking: "Privat24"),
                     "BTA Bank": BankLocalData(city: "Одеса",
                                               street: "вул. Прохоровська, 21",
                                               phone: "08004002205",
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
                        updateTime: rate.updateTime,
                        prices: [Prices(currency: "USD", buy: rate.usd.buy, sal: rate.usd.sel),
                                 Prices(currency: "EUR", buy: rate.eur.buy, sal: rate.eur.sel),
                                 Prices(currency: "RUR", buy: rate.rur.buy, sal: rate.rur.sel),
                                 Prices(currency: "GBN", buy: rate.gbp.buy, sal: rate.gbp.sel),
                                 Prices(currency: "CHF", buy: rate.chf.buy, sal: rate.chf.sel),
                                 Prices(currency: "PLN", buy: rate.pln.buy, sal: rate.pln.sel)
                        ])
        return bank
        
    }
    
    private func convertToBankModel(exchanger: Exchanger) -> Bank {
        let rate = exchanger.rates
        
        let bank = Bank(name: exchanger.name,
                        city: "", street: "",
                        phone: "",
                        supportPhone: "",
                        worldSupportPhone: "",
                        mail: "",
                        imageUrl: exchanger.image,
                        webSite: exchanger.website,
                        internetBanking: "",
                        updateTime: rate.updateTime,
                        prices: [Prices(currency: "USD", buy: rate.usd.buy, sal: rate.usd.sel),
                                 Prices(currency: "EUR", buy: rate.eur.buy, sal: rate.eur.sel),
                                 Prices(currency: "RUR", buy: rate.rur.buy, sal: rate.rur.sel),
                                 Prices(currency: "GBN", buy: rate.gbp.buy, sal: rate.gbp.sel),
                                 Prices(currency: "CHF", buy: rate.chf.buy, sal: rate.chf.sel),
                                 Prices(currency: "PLN", buy: rate.pln.buy, sal: rate.pln.sel)])
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
