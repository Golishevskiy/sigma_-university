//
//  Figure+Area.swift
//  Task1
//
//  Created by Petro Golishevskiy on 04.04.2021.
//

import Foundation

extension Figure {
    
    var area: Double {
        get {
            return Figure.area(of: self)
        }
    }
    
    var perimeter: Double {
        get {
            return Figure.perimeter(of: self)
        }
    }
    
    static func area(of figure: Figure) -> Double {
        if figure.points.count > 2 {
            let area = areaAnyFigure(figure: figure)
            return area
        } else {
            print("Area of this figure cannot be calculated\nThis figure is a \(figure.figureType)")
            return 0.0
        }
    }
    
    static func perimeter(of figure: Figure) -> Double {
        switch figure.figureType {
        case .point:
            print("Perimeter of this figure cannot be calculated\nThis figure is a \(figure.figureType)")
            return 0.0
        case .line:
            return lineLength(line: figure)
        default:
            return perimeterAnyFigure(an: figure)
        }
    }
    
    // calculates the perimeter of any closed figure (triangle, rectangle, square, polygon)
    static fileprivate func perimeterAnyFigure(an figure: Figure) -> Double {
        var result = 0.0
        
        for i in 0..<figure.points.count - 1 {
            let line = sqrt((pow(figure.points[i+1].cartesian.x - figure.points[i].cartesian.x, 2) + pow(figure.points[i+1].cartesian.y - figure.points[i].cartesian.y, 2)))
            result += line
        }
        let lastLine = sqrt((pow(figure.points[figure.points.count - 1].cartesian.x - figure.points[0].cartesian.x, 2) + pow(figure.points[figure.points.count - 1].cartesian.y - figure.points[0].cartesian.y, 2)))
        result += lastLine
        
        return result
    }
    
    static fileprivate func lineLength(line: Figure) -> Double {
        let result = sqrt((pow(line.points[1].cartesian.x - line.points[0].cartesian.x, 2) + pow(line.points[1].cartesian.y - line.points[0].cartesian.y, 2)))
        return result
    }
    
    // calculates the area of any figure that has more than two angles (triangle, rectangle, square, polygon)
    static fileprivate func areaAnyFigure(figure: Figure) -> Double {
        var result = 0.0
        
        for i in 0..<figure.points.count - 1 {
            let pair = figure.points[i].cartesian.x * figure.points[i+1].cartesian.y
            result += pair
        }
        var lastPair = figure.points[figure.points.count - 1].cartesian.x * figure.points[0].cartesian.y
        result += lastPair
        
        for i in 0..<figure.points.count - 1 {
            let pair = figure.points[i].cartesian.y * figure.points[i+1].cartesian.x
            result -= pair
        }
        lastPair = figure.points[figure.points.count - 1].cartesian.y * figure.points[0].cartesian.x
        result -= lastPair
        
        return abs(result) / 2
    }
}

