//
//  main.swift
//  HomeWork7
//
//  Created by Petro Golishevskiy on 04.04.2021.
//

import Foundation

var A = Point(x: 0, y: 1)
var B = Point(x: 5, y: 1)
var C = Point(x: 8, y: 8)
var D = Point(x: 10, y: 0)

var F = Figure(points: [A, C, B], name: "line")

var figur = Figure(points: [A, B])
print(F.figureType)
print(F.perimeter)
print(F.area)


var line = Line(firstPoint: A, secondPoint: B)
print(line.distanceBetweenPoints)
print(line.figureName)
print(line.figureType)

print("distance AB \(line.distanceBetweenPoints)")
//print("module of vector \(line.vectorModule.description)")
//print("scalar product of vector \(line.scalarProduct.description)")

var vector = Vector(startPoint: A, endPoint: B)
