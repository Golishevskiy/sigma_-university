//
//  Point.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

class Point {
    var x: Double
    var y: Double
    var description: String {
        return "(\(x);\(y))"
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}
