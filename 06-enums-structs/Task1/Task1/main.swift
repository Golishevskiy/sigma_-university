//
//  main.swift
//  Task1
//
//  Created by Petro Golishevskiy on 03.04.2021.
//

import Foundation

// Описати дві функції, що дозволяють змістити точку у нову позицію за координатами у декартовій (x; y) та полярній (radius; angle) системах.

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

// Описати функцію приведення точки до рядкового представлення з параметром, який вказує систему координат, у якій повинна бути виведена точка (за замовчуванням, декартова система координат).

pointB.showСordinates() // default is cartesian
pointB.showСordinates(in: .polar)

// Описати розширення (в іншому файлі), де визначити функцію типу, яка повертає відстань між двома точками.

var pointA = Point(radius: 10, angle: 78)
let distance = Point.distanceBetweenPoints(firstPoint: pointA, secondPoint: pointB)
print("distance between points = \(distance)")

// Описати розширення (в іншому файлі), де визначити два додаткові ініціалізатори створення точки на основі інших користувацьких типів CartesianCoordinates та PolarCoordinates, які мають бути описані у даному файлі (використати методи для ініціалізації обєктів).

Point.init(CartesianCoordinatesX: 7, CartesianCoordinatesY: -10)
Point.init(PolarCoordinatesRadius: 5, PolarCoordinatesAngle: 90)

// Описати розширення (у окремому файлі підпункта 7), де визначити чотири функції типу, які повертають створену точку на основі декартових (x; y) та полярних (radius; angle) координат, а також користувацьких типів CartesianCoordinates та PolarCoordinates.

let pointC = Point.point(cartesianX: 3, cartesianY: 2)
let pointD = Point.point(polarRadius: 7, polarAngle: -45)
let pointE = Point.point(userCartesianX: 4, userCartesianY: 5)
let pointF = Point.point(userPolarRadius: 3, userPolarAngle: 29)


let A = Point(x: 0, y: 1)
let B = Point(x: 5, y: 1)
let C = Point(x: 8, y: 8)
let D = Point(x: 13, y: -10)
let E = Point(x: -34, y: 10)

// Описати ініціалізатори для створення фігури з допомогою масива точок, або ряду точок. Тип фігури визначається у момент її створення.

var figureA = Figure(point: [A, B, C, D, E])
print("Figure type is - \(figureA.figureType)")
print("-------------------------")

// Описати індексатор (subscript), який повертає точку фігури фігури за індексом.

let point = figureA[0]
print(point)
print("-------------------------")

// Описати розширення (в іншому файлі), де визначити дві функції типу, які обраховують та повертають площу, а також периметер фігури.

let area = Figure.area(of: figureA)
print("area = \(area)")
let perimeter = Figure.perimeter(of: figureA)
print("perimeter = \(perimeter)")
print("-------------------------")

// Описати властивості (у файлі підпункта 5), що повертають площу та периметер фігури.

print(figureA.area)
print(figureA.perimeter)
