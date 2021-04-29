//
//  Figure.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 04.04.2021.
//

import Foundation

enum FigureError: Error {
    case notFigure
}

enum FigureType {
    case line
    case triangle
    case quadrangle
    case unknown
}

class Figure {
    var figureName: String?
    var points: [Point] = []
    var figureType: FigureType {
        get {
            switch points.count {
            case 2:
                return .line
            case 3:
                return .triangle
            case 4:
                return .quadrangle
            default:
                return .unknown
            }
        }
    }
    
    var perimeter: Double? {
        get {
            perimeter(of: self)
        }
    }
    
    var area: Double {
        get {
            if self.points.count > 2 {
                return area(of: self)
            }
            else {
                return 0.0
            }
        }
    }
    
    init(points: [Point], name: String?) {
        self.points = points
        self.figureName = name
    }
    
    init(points: [Point]) throws {
        guard points.count >= 2 else {
            throw FigureError.notFigure
        }
        self.points = points
    }
    
    fileprivate func perimeter(of figure: Figure) -> Double? {
        guard [.quadrangle, .triangle].contains(where: { $0 == figure.figureType }) else { return nil }
        let point = figure.points
        var result = 0.0
        for i in 0..<figure.points.count - 1 {
            result += line(first: point[i], second: point[i + 1])
        }
        result += line(first: point[0], second: point[point.count - 1])
        return result
    }
    
    func line(first: Point, second: Point) -> Double {
        return sqrt(pow(second.x - first.x, 2) + pow(second.y - first.y, 2))
    }
    
    fileprivate func area(of figure: Figure) -> Double {
        var result = 0.0
        let point = figure.points
        
        for i in 0..<point.count - 1 {
            result += point[i].x * point[i+1].y - point[i].y * point[i+1].x
            
        }
        result += point[point.count - 1].x * point[0].y - point[point.count - 1].y * point[0].x
        return abs(result) / 2
    }
}




