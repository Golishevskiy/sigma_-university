//
//  Mathematics.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 25.04.2021.
//

import Foundation


enum ErrorMathematics: String, Error {
    case smallArray = "array has 2 elements"
}

protocol SomeFigure {
    
}

class Mathematics {
    var figures = [Figure]()
    
    init(figures: [Figure]) {
        self.figures = figures
    }
    
    func maxArea() throws -> (Figure, Double) {
        guard figures.count >= 2 else { throw ErrorMathematics.smallArray }
        
        let result = figures.reduce(figures[0]) { (res, figure) -> Figure in
            if figure.area > res.area {
                return figure
            } else {
                return res
            }
        }
        return (result, result.area)
    }
    
    func sumOfNumbers<T: SomeFigure>(figure: T) {
        print(figure)
    }
}




