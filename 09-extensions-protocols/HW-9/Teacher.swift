//
//  Teacher.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

protocol CanTeach {
    func toTeach()
}

class Teacher: Worker, CanTeach {
    
    override init(name: String,
                  lastName: String,
                  salary: Int,
                  dateOfBirth: UserDate,
                  inWorkDate: UserDate,
                  type: TypeWorker,
                  married: Bool,
                  higherEducation: Bool) {
        super.init(name: name,
                   lastName: lastName,
                   salary: salary,
                   dateOfBirth: dateOfBirth,
                   inWorkDate: inWorkDate,
                   type: type,
                   married: married,
                   higherEducation: higherEducation)
    }
    
    func toTeach() {
        print("\(self.firstName) taught students")
    }
}
