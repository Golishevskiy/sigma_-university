//
//  Fisherman.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

protocol Fisher {
    func catchAFish()
}

class Fisherman: Worker, Fisher {
    
    func catchAFish() {
        print("\(self.firstName) gave 5 kg of fish")
    }
}

