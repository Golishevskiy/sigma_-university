//
//  Line.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

enum ErrorLine: Error {
    case pointsAreEqual
}

class Line: Figure {
    var pointA: Point
    var pointB: Point
    var lenght: Double? {
        get {
            self.line(first: pointA, second: pointB)
        }
    }
    
    init?(firstPoint: Point, secondPoint: Point) throws {
        guard firstPoint != secondPoint else { throw ErrorLine.pointsAreEqual }
        
        pointA = firstPoint
        pointB = secondPoint
        try super.init(points: [firstPoint, secondPoint])
    }
}
