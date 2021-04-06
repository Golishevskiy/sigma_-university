//
//  Figure.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

struct Figure {
    private(set) var points: [Point]
    var figureType: FigureType
    
    init(point: [Point]) {
        self.points = point
        
        switch point.count {
        case 1:
            self.figureType = .point
        case 2:
            self.figureType = .line
        case 3:
            self.figureType = .triangle
        case 4:
            self.figureType = .square
        case 5...:
            self.figureType = .polygon
        default:
            self.figureType = .unknown
            print("I do not know such a figure")
        }
    }
    
    private func indexIsValid(index: Int) -> Bool {
        return index >= 0 && index < points.count
    }
    
    subscript(index: Int) -> Point {
        get {
            assert(indexIsValid(index: index), "index out of range")
            return points[index]
        }
    }
}
