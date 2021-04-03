//
//  main.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

struct CartesianPoint {
    var x: Double
    var y: Double
}

struct PolarPoint {
    var radius: Double
    var angle: Double
}

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



//Описати дві функції, що дозволяють змістити точку у нову позицію за координатами у декартовій (x; y) та полярній (radius; angle) системах.

var pointB = Point(x: 3, y: 1)
pointB.showСordinates(in: .cartesian)
pointB.showСordinates(in: .polar)
print("-------------------------")

pointB.move(x: 10, y: 7)
pointB.showСordinates(in: .cartesian)
pointB.showСordinates(in: .polar)
print("-------------------------")

pointB.move(radius: 7, angle: 45)
pointB.showСordinates(in: .cartesian)
pointB.showСordinates(in: .polar)
print("-------------------------")

//Описати функцію приведення точки до рядкового представлення з параметром, який вказує систему координат, у якій повинна бути виведена точка (за замовчуванням, декартова система координат).

pointB.showСordinates() // default is cartesian
pointB.showСordinates(in: .polar)

//Описати розширення (в іншому файлі), де визначити функцію типу, яка повертає відстань між двома точками.

var pointA = Point(radius: 10, angle: 78)
let distance = Point.distanceBetweenPoints(firstPoint: pointA, secondPoint: pointB)
print("distance between points = \(distance)")

// Описати розширення (в іншому файлі), де визначити два додаткові ініціалізатори створення точки на основі інших користувацьких типів CartesianCoordinates та PolarCoordinates, які мають бути описані у даному файлі (використати методи для ініціалізації обєктів).

Point.init(CartesianCoordinatesX: 7, CartesianCoordinatesY: -10)
Point.init(PolarCoordinatesRadius: 5, PolarCoordinatesAngle: 90)

//Описати розширення (у окремому файлі підпункта 7), де визначити чотири функції типу, які повертають створену точку на основі декартових (x; y) та полярних (radius; angle) координат, а також користувацьких типів CartesianCoordinates та PolarCoordinates.

let pointC = Point.point(cartesianX: 3, cartesianY: 2)
let pointD = Point.point(polarRadius: 7, polarAngle: -45)
let pointE = Point.point(userCartesianX: 4, userCartesianY: 5)
let pointF = Point.point(userPolarRadius: 3, userPolarAngle: 29)

