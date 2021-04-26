//
//  Point.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

enum PointError: Error {
    case outOfRange
}

class Point {
    var x: Double
    var y: Double
    var description: String {
        return "(\(x);\(y))"
    }
    
    init(x: Double, y: Double) throws {
        guard x <= 1000, y <= 1000 else { throw PointError.outOfRange }
        self.x = x
        self.y = y
    }
    
    static func !=(lhs: Point, rhs: Point) -> Bool {
        return rhs.x != lhs.x || lhs.y != rhs.y
    }
}




