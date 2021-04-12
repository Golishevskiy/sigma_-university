//
//  Factory.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

class Factory {
    var workers: [Worker]
    var director: Director
    init(workers: [Worker], director: Director) {
        self.workers = workers
        self.director = director
    }
}
