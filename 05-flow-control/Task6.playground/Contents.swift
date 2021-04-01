import UIKit

//types for circles and points
typealias Point = (x: Double, y: Double)
typealias Circle = (center: Point, radius: Double)

func circle(array: [Circle], point: Point) -> Circle? {
    var circlesArray = [(Circle, distance: Double)]()
    
    for (center, radius) in array {
        if distanceLine(from: center, to: point) < radius {
            circlesArray.append(((center, radius), (Double.pi * 2 * radius)))
        }
    }
    
    circlesArray.sort { (arg0, arg1) -> Bool in
        return arg0.distance < arg1.distance
    }
    
    return circlesArray.last?.0
}

func distanceLine(from first: Point,to second: Point) -> Double {
    return sqrt(((second.x - first.x)*(second.x - first.x)) + ((second.y - first.y) * (second.y - first.y)))
}

//coordinate circles and points for example
let arrayCircles = [((10.0, 10.0), 10.0), ((1.0, 7.0), 5.0), ((11.0, 7.0), 18.0), ((11.0, 7.0), 50.0)]

circle(array: arrayCircles, point: (10.0, 6.0))




