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
                       higherEducation: true)

var maksim = Driver(name: "Maksim",
                       lastName: "Petrov",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .fisherman,
                       married: true,
                       higherEducation: true)

var taras = Teacher(name: "Taras",
                       lastName: "Fil",
                       salary: 2000,
                       dateOfBirth: UserDate(year: 1996, month: 5, day: 28),
                       inWorkDate: UserDate(year: 2015, month: 7, day: 12),
                       type: .fisherman,
                       married: true,
                       higherEducation: true)



maksim.drinkCoffee()
var directorJames = Director(name: "James")
directorJames.fishDelegate = alexey
directorJames.teachDelegate = taras
directorJames.driverDelegate = maksim
taras.getPaid()
directorJames.trainStaff()
directorJames.deliverFish(fisher: alexey, driver: maksim)

