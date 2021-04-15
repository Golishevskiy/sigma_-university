//
//  Worker.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

enum TypeWorker {
    case fisherman
    case teacher
    case driver
    case seller
}

class Worker {
    var firstName: String
    var lastName: String
    var salary: Int
    var dateOfBirth: UserDate
    var inWorkDate: UserDate
    var type: TypeWorker
    var married: Bool
    var higherEducation: Bool
    let currentYear = 2021
    var experience = 0
    var age: Int {
        return currentYear - self.dateOfBirth.year
    }
    init(name: String,
         lastName: String,
         salary: Int,
         dateOfBirth: UserDate,
         inWorkDate: UserDate,
         type: TypeWorker,
         married: Bool,
         higherEducation: Bool,
         experience: Int?) {
        self.firstName = name
        self.lastName = lastName
        self.salary = salary
        self.dateOfBirth = dateOfBirth
        self.inWorkDate = inWorkDate
        self.type = type
        self.married = married
        self.higherEducation = higherEducation
        self.experience = experience ?? 0
    }
    
    func sayHello() {
        print("\(self.firstName) said Hello")
    }
    
    func complain() {
        print("\(self.firstName) said: I'm very tired")
    }
    
    func drinkCoffee() {
        print("\(self.firstName) drink Coffee")
    }
    
    func sleep() {
        print("\(self.firstName) is sleeping")
    }
    
    func eat() {
        print("\(self.firstName) eats")
    }
    
    func getPaid() {
        print("\(self.firstName) takes the money")
    }
}





