//
//  Point+UserType.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

extension Point {
    
    init(CartesianCoordinatesX: Double,CartesianCoordinatesY: Double) {
        userCartesian.x = CartesianCoordinatesX
        userCartesian.y = CartesianCoordinatesY
    }
    
    init(PolarCoordinatesRadius: Double, PolarCoordinatesAngle: Double) {
        userPolar.angle = PolarCoordinatesAngle
        userPolar.radius = PolarCoordinatesRadius
    }
}

struct CartesianCoordinates {
    var x: Double
    var y: Double
}

struct PolarCoordinates {
    var radius: Double
    var angle: Double
}
