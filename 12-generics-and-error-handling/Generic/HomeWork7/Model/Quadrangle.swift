//
//  Quadrangle.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

enum ErrorQuadrangle: Error {
    case pointsAreEqual
}

class Quadrangle: Figure, SomeFigure {
    var pointA: Point
    var pointB: Point
    var pointC: Point
    var pointD: Point
    
    init?(pointA: Point, pointB: Point, pointC: Point, pointD: Point) throws {
        guard pointA != pointB,
              pointA != pointC,
              pointA != pointD else { throw ErrorQuadrangle.pointsAreEqual }
        guard pointB != pointC,
              pointB != pointD else { throw ErrorQuadrangle.pointsAreEqual }
        guard pointC != pointD else { throw ErrorQuadrangle.pointsAreEqual }
        
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        self.pointD = pointD
        try? super.init(points: [pointA, pointB, pointC, pointD])
    }
}
