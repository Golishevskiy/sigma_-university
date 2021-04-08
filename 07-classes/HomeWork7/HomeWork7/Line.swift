//
//  Line.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

class Line: Figure {
    var pointA: Point
    var pointB: Point
    var distanceBetweenPoints: Double {
        get {
            self.perimeter
        }
    }
    
//    var vector: Vector
//    
//    var vectorModule: Point {
//        get {
//            vector.moduleOfVector()
//        }
//    }

    
    init(firstPoint: Point, secondPoint: Point) {
        pointA = firstPoint
        pointB = secondPoint
//        self.vector = Vector(startPoint: pointA, endPoint: pointB)
        super.init(points: [firstPoint, secondPoint])
    }
    
}
