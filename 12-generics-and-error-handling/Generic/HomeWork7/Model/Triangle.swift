//
//  Triangle.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

enum TriangleType {
    case equilateral
    case isosceles
    case notEquilateral
}

enum ErrorTriangle: Error {
    case pointsAreEqual
}

class Triangle: Figure, SomeFigure {
    var pointA: Point
    var pointB: Point
    var pointC: Point
    
    init?(pointA: Point, pointB: Point, pointC: Point)  throws {
        guard pointA != pointB && pointA != pointC && pointC != pointB
        else { throw ErrorTriangle.pointsAreEqual }
        
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        try super.init(points: [pointA, pointB, pointC])
    }
}
