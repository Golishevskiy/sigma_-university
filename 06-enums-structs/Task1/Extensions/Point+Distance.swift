//
//  Point+Distance.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

extension Point {
    
    static func distanceBetweenPoints(firstPoint: Point, secondPoint: Point) -> Double {
        let xLine = secondPoint.cartesian.x - firstPoint.cartesian.x
        let yLine = secondPoint.cartesian.y - firstPoint.cartesian.y
        let distance = sqrt(pow(xLine, 2) + pow(yLine, 2))
        return distance
    }
}
