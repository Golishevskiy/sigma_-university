//
//  Point+initMethods.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

extension Point {
    
    static func point(cartesianX: Double, cartesianY: Double) -> Point {
        let point = Point(x: cartesianX, y: cartesianY)
        return point
    }
    
    static func point(polarRadius: Double, polarAngle: Double) -> Point {
        let point = Point(radius: polarRadius, angle: polarAngle)
        return point
    }
    
    static func point(userPolarRadius: Double, userPolarAngle: Double) -> Point {
        let point = Point(PolarCoordinatesRadius: userPolarRadius, PolarCoordinatesAngle: userPolarAngle)
        return point
    }
    
    static func point(userCartesianX: Double, userCartesianY: Double) -> Point {
        let point = Point(CartesianCoordinatesX: userCartesianX, CartesianCoordinatesY: userCartesianY)
        return point
    }
}
