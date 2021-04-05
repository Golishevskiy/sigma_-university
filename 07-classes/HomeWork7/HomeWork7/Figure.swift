//
//  Figure.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 04.04.2021.
//

import Foundation

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
    var perimeter: Double {
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
    
    init(points: [Point]) {
        self.points = points

    }
    
    fileprivate func perimeter(of figure: Figure) -> Double {
        let point = figure.points
        
        switch figure.figureType {
        case .line:
            let line = sqrt(pow(figure.points[1].x - figure.points[0].x, 2) + pow(figure.points[1].y - figure.points[0].y, 2))
            return line
        case .triangle, .quadrangle:
            var result = 0.0
            for i in 0..<figure.points.count - 1 {
                result += sqrt(pow(point[i+1].x - point[i].x, 2) + pow(point[i+1].y - point[i].y, 2))
            }
            result += sqrt(pow(point[point.count - 1].x - point[0].x, 2) + pow(point[point.count - 1].y - point[0].y, 2))
            return result
        default:
            return 0.0
        }
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

enum FigureType {
    case line
    case triangle
    case quadrangle
    case unknown
}



