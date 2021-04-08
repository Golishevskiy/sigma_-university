//
//  Vector.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 05.04.2021.
//

import Foundation

class Vector: Line {
    var startPoint: Point
    var endPoint: Point
    
    init(startPoint: Point, endPoint: Point) {
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(firstPoint: startPoint, secondPoint: endPoint)
    }
    
    func moduleOfVector() -> Point {
        return Point(x: endPoint.x - startPoint.x, y: endPoint.y - startPoint.y)
    }
        
    func scalarProduct(first: Point, second: Point) -> Point {
        return Point(x: first.x * second.x, y: first.y * second.y)
    }
}
