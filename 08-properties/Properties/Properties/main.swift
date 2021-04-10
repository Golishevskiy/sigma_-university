//
//  main.swift
//  Properties
//
//  Created by Petro Golishevskiy on 07.04.2021.
//

import Foundation

infix operator ~~ : TildaOperatorPrecedence

precedencegroup TildaOperatorPrecedence {
    higherThan: BitwiseShiftPrecedence
}

enum Operation {
    case plus, minus
}

class Fraction {
    
    var numerator: Int {
        didSet {
            self.decimal = toDecimal
        }
    }
    
    var denominator: Int {
        didSet {
            self.decimal = toDecimal
        }
    }
    
    var decimal = 0.0
    lazy var multiplyBy2 = multiply(by: 2)
    lazy var multiplyBy3 = multiply(by: 3)
    lazy var invert = toInvert()
    
    
    var toDecimal: Double {
        return Double(numerator) / Double(denominator)
    }
    
    var description: String {
        return toString()
    }
    
    var descriptionObject: String {
        return allObject()
    }
    
    init(numerator n: Int, denominator d: Int) {
        self.numerator = n
        self.denominator = d
        self.decimal = self.toDecimal
    }
    
    convenience init(decimal: Double) {
        self.decimal = decimal
        
        self.init(numerator: Int, denominator: Int)
    }
    
    subscript(index: String) -> Int? {
        get {
            switch index {
            case "n": return self.numerator
            case "m": return self.denominator
            default:
                return nil
            }
        }
        set(newValue) {
            guard let value = newValue else { return }
            switch index {
            case "n":
                self.numerator = value
            case "m":
                self.denominator = value
            default:
                print("index out of range")
            }
        }
    }
    
    subscript(index: String) -> Double? {
        if index == "d" {
            return self.toDecimal
        } else {
            return nil
        }
    }
    
    static func ~~(lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.invert.add(to: rhs.invert)
    }
    
    private func toString() -> String {
        return "\(self.numerator)/\(self.denominator)"
    }
    
    private func allObject() -> String {
        let result = """
                        numerator = \(self.numerator)
                        denominator = \(self.denominator)
                        decimal = \(self.decimal)
                        multiplyBy2 = \(self.multiplyBy2.description)
                        multiplyBy3 = \(self.multiplyBy3.description)
                      """
        return result
    }
    
    static func toFraction(decimal: Double) -> (n: Int, d: Int) {
        print("toFraction")
        var n = decimal
        var d = 1
        
        while n.truncatingRemainder(dividingBy: 1.0) != 0 {
            n *= 10
            d *= 10
            print("while")
        }
        
        let num = Int(n)
        let den = Int(d)
        print(num)
        print(den)
        
        let divider = 2
        
        return (num / divider, den / divider)
    }
    
    private func multiply(by multiplier: Int) -> Fraction {
        let newNumerator = self.numerator * multiplier
        return Fraction(numerator: newNumerator, denominator: self.denominator)
    }
    
    func multiply(by fraction: Fraction) -> Fraction {
        let numerator = self.numerator * fraction.numerator
        let denominator = self.denominator * fraction.denominator
        return Fraction(numerator: numerator, denominator: denominator)
    }
    
    func divide(by fraction: Fraction) -> Fraction {
        let invertFraction = fraction.invert
        let result = self.multiply(by: invertFraction)
        return result
    }
    
    func add(to fraction: Fraction) -> Fraction {
        return additionOrSubtraction(first: self,
                                     second: fraction,
                                     operation: .plus)
    }
    
    func subtract(from fraction: Fraction) -> Fraction {
        return additionOrSubtraction(first: self,
                                     second: fraction,
                                     operation: .minus)
    }
    
    func GreaterThan(fraction: Fraction) -> Bool {
        return self.toDecimal > fraction.toDecimal
    }
    
    func LessThan(fraction: Fraction) -> Bool {
        return self.toDecimal < fraction.toDecimal
    }
    
    func Equal(to fraction: Fraction) -> Bool {
        return self.toDecimal == fraction.toDecimal
    }
    
    func NotEqual(to fraction: Fraction) -> Bool {
        return self.toDecimal != fraction.toDecimal
    }
}

// extension
 extension Fraction {
    private func additionOrSubtraction(first: Fraction,
                                       second: Fraction,
                                       operation: Operation) -> Fraction {
        let newFirst = Fraction(numerator: first.numerator * second.denominator,
                                denominator: first.denominator * second.denominator)
        
        let newSecond = Fraction(numerator: second.numerator * first.denominator,
                                 denominator: second.denominator * first.denominator)
        var result: Fraction
        switch operation {
        case .plus:
            result = Fraction(numerator: newFirst.numerator + newSecond.numerator,
                              denominator: newFirst.denominator)
        case .minus:
            result = Fraction(numerator: newFirst.numerator - newSecond.numerator,
                              denominator: newFirst.denominator)
        }
        
        let divider = gcd(first: result.numerator, second: result.denominator)
        result.numerator /= divider
        result.denominator /= divider
        
        return result
    }
    
    private func gcd(first: Int, second: Int) -> Int {
        if (first == 0) {
            return second
        } else {
            return gcd(first: second % first, second: first)
        }
    }
    
    private func toInvert() -> Fraction {
        return Fraction(numerator: self.denominator, denominator: self.numerator)
    }
}
/*
let number = Fraction(numerator: 10, denominator: 7)
let number1 = Fraction(numerator: 1, denominator: 3)

// подвоєне значення числа (lazy)
let x2 = number.multiplyBy2
print("x2 = \(x2.description)")

// потроєне значення числа (lazy)
let x3 = number.multiplyBy3
print("x2 = \(x3.description)")

// обернений дріб (lazy)
let inv = number.invert
print("invert = \(inv.description)")

// виводили повний опис об’єкту (computed property)
print(number.descriptionObject)

// виводили значення в десятковому вигляді (computed property)
print(number.toDecimal)

// Клас має мати subscript (функція на вибір)


// 7. Реалізувати в Fraction методи для операцій “+”,“-”,“*” та “/”.
print(number.add(to: number1).description)
print(number.subtract(from: number1).description)
print(number.divide(by: number1).description)
print(number.multiply(by: number1).description)

// Реалізувати операції порівняння об’єктів типу Fraction (>, <, !=, ==).
let number2 = Fraction(numerator: 5, denominator: 7)
print(number.Equal(to: number2))
print(number.LessThan(fraction: number1))
print(number.GreaterThan(fraction: number1))
print(number.NotEqual(to: number1))

// Описати власний infix оператор »~~».Пріоритет - найвищий
print((number~~number1).description)


*/
//

let number = Fraction(numerator: 1, denominator: 2)
print(number.descriptionObject)
let number1 = Fraction(numerator: 2, denominator: 3)
print(number1.descriptionObject)

number.numerator = 3
print(number.descriptionObject)

print("********")
number.decimal = 2.0

print(number.descriptionObject)
//number ~~ number1
//print(number.descriptionObject)
//number.decimal = 0.75
//
//print(number.descriptionObject)
//print("_---------__-------__------_-----")
//number.decimal = 1
//
//print(number.descriptionObject)
//print("_---------__-------__------_-----")





