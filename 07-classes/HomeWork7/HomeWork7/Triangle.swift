//
//  Triangle.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

class Triangle: Figure {
    var pointA: Point
    var pointB: Point
    var pointC: Point
    
    init(pointA: Point, pointB: Point, pointC: Point) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        super.init(points: [pointA, pointB, pointC])
    }
    
    
}

enum TriangleType {
    case equilateral
    case isosceles
    case notEquilateral
}
