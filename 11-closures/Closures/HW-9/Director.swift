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
    typealias closure = () -> Void
    
    init(name: String) {
        self.name = name
    }
    
    func toDeliver(completion: closure) {
        completion()
    }
    
    func getFish(completion: closure) {
        completion()
    }
    
    func sell(completion: closure) {
        completion()
    }
    
    func trainStaff(completion: closure) {
        completion()
    }
    
    func interview(worker: Worker) -> Bool {
        if worker.age > 75 || worker.age < 18 {
            return false
        }
        return true
    }
}

