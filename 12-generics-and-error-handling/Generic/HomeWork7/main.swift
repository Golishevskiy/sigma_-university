//
//  main.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 04.04.2021.
//

import Foundation

// використутовувався механізм обробки помилок на етапі ініціалізації
// екземплярів усіх класів (кожен клас описує окремий тип помилки);
do {
    let A = try Point(x: 10010, y: 1)
    print(A.x)
    print(A.y)
} catch {
    print(error)
}

do {
    let A = try Point(x: 1000, y: 100)
    let B = try Point(x: 1000, y: 100)
    _ = try Line(firstPoint: A, secondPoint: B)
} catch {
    print("Line not created. \(error)")
}

do {
    let A = try Point(x: 1, y: 5)
    let B = try Point(x: 2, y: 4)
    let C = try Point(x: 1, y: 6)
    let triangle = try Triangle(pointA: A, pointB: B, pointC: C)
    print(triangle?.perimeter)
} catch {
    print("Triangle not created. \(error)")
}

do {
    let A = try Point(x: 1, y: 5)
    let B = try Point(x: 1, y: 6)
    let C = try Point(x: 2, y: 4)
    let D = try Point(x: 1, y: 3)
    let quadrangle = try Quadrangle(pointA: A, pointB: B, pointC: C, pointD: D)
    print(quadrangle?.perimeter)
} catch {
    print("Triangle not created. \(error)")
}

do {
    let A = try Point(x: 1, y: 5)
    let B = try Point(x: 1, y: 6)
    let figure = try Figure(points: [A])
    print(figure.points.count)
} catch  {
    print(error)
}

// використутовувався механізм обробки помилок для одного з методів;
let A = try? Point(x: 10, y: 10)
let B = try? Point(x: 1, y: 10)
let C = try? Point(x: 12, y: 7)
let D = try? Point(x: 4, y: 22)

let triangle = try? Triangle(pointA: A!, pointB: B!, pointC: C!)

let A1 = try? Point(x: 10, y: 7)
let B1 = try? Point(x: 13, y: 10)
let C1 = try? Point(x: 12, y: 74)
let D1 = try? Point(x: 4, y: 22)

let triangle1 = try? Triangle(pointA: A1!, pointB: B1!, pointC: C1!)


var math = Mathematics(figures: [triangle!, triangle1!])

do {
    let result = try math.maxArea()
    print(result.0)
    print(result.1)
} catch {
    print(error)
}

// використовувався або універсальний клас, або універсальна функція;
let line = try Line(firstPoint: A1!, secondPoint: B1!)
// for example, will pass an argument to an object that is not conform
// to the protocol SomeFigure.

math.sumOfNumbers(figure: triangle1!)
//math.sumOfNumbers(figure: line!)




