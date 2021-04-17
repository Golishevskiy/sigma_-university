//
//  Director.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

protocol Interview {
    func interview(worker: Worker) -> Bool
}

class Director: Interview {
    
    var name: String
    
    var fishDelegate: Fisher?
    var driverDelegate: DriveACar?
    var teachDelegate: CanTeach?
    var sellDelegate: SellDoable?
    
    init(name: String) {
        self.name = name
    }
    
    func deliverFish(fisher: Fisherman, driver: Driver) {
        fishDelegate?.catchAFish()
        driverDelegate?.toDeliver()
        
    }
    
    func everyoneToWork() {
        fishDelegate?.catchAFish()
        driverDelegate?.toDeliver()
        teachDelegate?.toTeach()
        sellDelegate?.sellSomething()
    }
    
    func sell() {
        sellDelegate?.sellSomething()
    }
    
    func trainStaff() {
        teachDelegate?.toTeach()
    }
    
    func interview(worker: Worker) -> Bool {
        if worker.age > 75 || worker.age < 18 {
            return false
        }
        return true
    }
}

