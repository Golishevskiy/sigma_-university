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
 
    override init(name: String,
                  lastName: String,
                  salary: Int,
                  dateOfBirth: UserDate,
                  inWorkDate: UserDate,
                  type: TypeWorker,
                  married: Bool,
                  higherEducation: Bool,
                  experience: Int?) {
        super.init(name: name,
                   lastName: lastName,
                   salary: salary,
                   dateOfBirth: dateOfBirth,
                   inWorkDate: inWorkDate,
                   type: type,
                   married: married,
                   higherEducation: higherEducation,
                   experience: experience)
    }
    
    func toDeliver() {
        print("\(self.firstName) delivered something")
    }
}
