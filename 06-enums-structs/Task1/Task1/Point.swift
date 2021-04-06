//
//  Point.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

struct Point {
    private(set) var polar = PolarPoint(radius: 0, angle: 0)
    private(set) var cartesian = CartesianPoint(x: 0, y: 0)
    var userCartesian = CartesianCoordinates(x: 0, y: 0)
    var userPolar = PolarCoordinates(radius: 0, angle: 0)
    
    init(x: Double, y: Double) {
        cartesian.x = x
        cartesian.y = y
        
        let radius = sqrt(pow(x, 2) + pow(y, 2))
        let angle = atan(y / x) * (180 / Double.pi)
        
        polar.angle = angle
        polar.radius = radius
    }
    
    init(radius: Double, angle: Double) {
        polar.radius = radius
        polar.angle = angle
        
        let x = radius * cos(angle / (180 / Double.pi))
        let y = radius * sin(angle / (180 / Double.pi))
        
        cartesian.x = x
        cartesian.y = y
    }
    
    mutating func move(x: Double, y: Double) {
        cartesian.x = x
        cartesian.y = y
        
        let radius = sqrt(pow(x, 2) + pow(y, 2))
        let angle = atan(y / x) * (180 / Double.pi)
        
        polar.angle = angle
        polar.radius = radius
    }
    
    mutating func move(radius: Double, angle: Double) {
        polar.radius = radius
        polar.angle = angle
        
        let x = radius * cos(angle / (180 / Double.pi))
        let y = radius * sin(angle / (180 / Double.pi))
        
        cartesian.x = x
        cartesian.y = y
    }
    
    func showСordinates(in system: System = .cartesian) {
        switch system {
        case .cartesian:
            print("Coordinates of point:\n x = \(cartesian.x)\n y = \(cartesian.y)")
        case .polar:
            print("Coordinates of point:\n radius = \(polar.radius)\n angle = \(polar.angle)")
        }
    }
}

struct CartesianPoint {
    var x: Double
    var y: Double
}

struct PolarPoint {
    var radius: Double
    var angle: Double
}
