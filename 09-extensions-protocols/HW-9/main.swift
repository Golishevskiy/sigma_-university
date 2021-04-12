//
//  main.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

var alexey = Fisherman(name: "Alexey",
                       lastName: "Maslakov",
                       salary: 3000,
                       dateOfBirth: UserDate(year: 1991, month: 1, day: 21),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .fisherman,
                       married: true,
                       higherEducation: true,
                       experience: 0)

var maksim = Driver(name: "Maksim",
                       lastName: "Petrov",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .driver,
                       married: true,
                       higherEducation: true, experience: 6)

var taras = Teacher(name: "Taras",
                       lastName: "Fil",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .teacher,
                       married: true,
                       higherEducation: true, experience: 0)

var artur = Seller(name: "Artur",
                       lastName: "Semenov",
                       salary: 2200,
                       dateOfBirth: UserDate(year: 2000, month: 10, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .seller,
                       married: true,
                       higherEducation: true,
                       experience: 1)

var stas = Seller(name: "Stat",
                       lastName: "Nikitenko",
                       salary: 1800,
                       dateOfBirth: UserDate(year: 1994, month: 18, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .seller,
                       married: false,
                       higherEducation: true,
                       experience: 0)



maksim.drinkCoffee()
var directorJames = Director(name: "James")
directorJames.fishDelegate = alexey
directorJames.teachDelegate = taras
directorJames.driverDelegate = maksim
taras.getPaid()
directorJames.trainStaff()
directorJames.sellDelegate = artur
artur.sellSomething()
directorJames.deliverFish(fisher: alexey, driver: maksim)

let isHired = directorJames.interview(worker: artur)
print(isHired)

let someFactory = Factory(workers: [alexey, maksim, taras], director: directorJames)


someFactory.addWorker(worker: artur)
someFactory.printWorkers()

someFactory.fireWorker(worker: artur)

someFactory.changeSalary(from: taras, newSalary: 1000)

let searchResult = someFactory.search(worker: stas)
print("search result - \(String(describing: searchResult?.firstName))")

let searchResult1 = someFactory.search(worker: maksim)
print("search result - \(String(describing: searchResult1?.firstName))")

someFactory.calculateSalary(worker: taras)
someFactory.calculateSalary(worker: maksim)





