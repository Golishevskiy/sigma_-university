//
//  Int+Name.swift
//  Queue
//
//  Created by Petro Golishevskiy on 24.04.2021.
//

import Foundation

extension Int: CustomTask {
    var name: String {
        get {
            return "Task \(self.description)"
        }

    }
}
