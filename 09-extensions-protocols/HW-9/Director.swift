//
//  Director.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

class Director {
    var name: String
    var fishDelegate: Fisher?
    var driverDelegate: DriveACar?
    var teachDelegate: CanTeach?
    
    init(name: String) {
        self.name = name
    }
    
    func deliverFish(fisher: Fisherman, driver: Driver) {
        fishDelegate?.catchAFish()
        driverDelegate?.toDeliver()
        
    }
    
    func trainStaff() {
        teachDelegate?.toTeach()
    }
}

