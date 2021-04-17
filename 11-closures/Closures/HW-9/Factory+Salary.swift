//
//  Factory+Salary.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 12.04.2021.
//

import Foundation

extension Factory {
    func calculateSalary(worker: Worker) -> Int {
        switch worker.experience {
        case 0...1:
            print("2000 USD")
            return 2000
        case 1...2:
            print("3000 USD")
            return 2000
        case 2...5:
            print("4000 USD")
            return 2000
        case let a where a > 5:
            print("6000 USD")
            return 2000
        default:
            print("0 USD")
            return 0
        }
    }
}
