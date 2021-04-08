//
//  Quadrangle.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

class Quadrangle: Figure {
    var pointA: Point
    var pointB: Point
    var pointC: Point
    var pointD: Point
    
    init(pointA: Point, pointB: Point, pointC: Point, pointD: Point) {
        self.pointA = pointA
        self.pointB = pointB
        self.pointC = pointC
        self.pointD = pointD
        super.init(points: [pointA, pointB, pointC, pointD])
    }
    
}
