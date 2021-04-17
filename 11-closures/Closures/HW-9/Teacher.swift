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
    func toTeach() {
        print("\(self.firstName) taught students")
    }
}
