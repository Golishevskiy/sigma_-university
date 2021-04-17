//
//  Driver.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

protocol DriveACar {
    func toDeliver()
}

class Driver: Worker, DriveACar {
    
    func toDeliver() {
        print("\(self.firstName) delivered something")
    }
}
