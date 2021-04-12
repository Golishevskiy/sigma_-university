//
//  main.swift
//  Properties
//
//  Created by Petro Golishevskiy on 07.04.2021.
//

import Foundation
import Swift

infix operator ~~ : TildaOperatorPrecedence
infix operator +  : AdditionPrecedence
infix operator -  : AdditionPrecedence
infix operator *  : MultiplicationPrecedence
infix operator /  : MultiplicationPrecedence

precedencegroup TildaOperatorPrecedence {
    higherThan: MultiplicationPrecedence
}

precedencegroup AdditionOperatorPrecedence {
    associativity: left
    lowerThan: RangeFormationPrecedence
    
}

precedencegroup MultiplicationOperatorPrecedence {
    associativity: left
    higherThan: AdditionOperatorPrecedence
}

enum Operation {
    case plus, minus
}

class Fraction {
    // MARK: - properties
    var numerator: Int = 0 {
        didSet {
            if oldValue != numerator {
                self.decimal = toDecimal
            }
        }
    }
    
    var denominator: Int = 0 {
        didSet {
            if oldValue != denominator {
                self.decimal = toDecimal
            }
        }
    }
    
    var decimal: Double = 0.0 {
        didSet {
            if oldValue != decimal {
                let value1 = toFraction(decimal: self.decimal)
                self.numerator = value1.n
                self.denominator = value1.d
            }
        }
    }
    
    lazy var multiplyBy2 = multiply(by: 2)
    lazy var multiplyBy3 = multiply(by: 3)
    lazy var invert = toInvert()
    
    var toDecimal: Double {
        let dec = Double(numerator) / Double(denominator)
        return Double(round(100*dec)/100)
    }
    
    var description: String {
        return toString()
    }
    
    var descriptionObject: String {
        return allObject()
    }
    
    // MARK: - init
    init(numerator n: Int, denominator d: Int) {
        self.numerator = n
        self.denominator = d
        self.decimal = self.toDecimal
    }
    
    init(decimal: Double) {
        self.decimal = decimal
        let result = toFraction(decimal: self.decimal)
        self.numerator = result.n
        self.denominator = result.d
    }
    
    // MARK: - operator overload
    static func ~~(lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.add(to: rhs)
    }
    
    static func + (lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.add(to: rhs)
    }
    
    static func - (lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.subtract(from: rhs)
    }
    
    static func * (lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.multiply(by: rhs)
    }
    
    static func / (lhs: Fraction, rhs: Fraction) -> Fraction {
        return lhs.divide(by: rhs)
    }
    
    // MARK: - functions
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
    
    func toInvert() -> Fraction {
        return Fraction(numerator: self.denominator, denominator: self.numerator)
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
    
    func toFraction(decimal : Double, withPrecision eps : Double = 1.0E-6) -> (n: Int, d: Int) {
        var x = decimal
        var a = floor(x)
        var (h1, k1, h, k) = (1, 0, Int(a), 1)
        
        while x - a > eps * Double(k) * Double(k) {
            x = 1.0/(x - a)
            a = floor(x)
            (h1, k1, h, k) = (h, k, h1 + Int(a) * h, k1 + Int(a) * k)
        }
        return (h, k)
    }
    
    // sometimes falls
    //    func toFraction(decimal: Double) -> (n: Int, d: Int) {
    //        var n = decimal
    //        var d = 1
    //
    //        while n.truncatingRemainder(dividingBy: 1.0) != 0 {
    //            n *= 10
    //            d *= 10
    //            print(n)
    //        }
    //
    //        let num = Int(n)
    //        let den = Int(d)
    //        print(num)
    //
    //        let divider = gcd(first: num, second: den)
    //
    //        return (num / divider, den / divider)
    //    }
    
}

// MARK: - extension
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
    
    func gcd(first x: Int, second y: Int) -> Int {
        var a = 0
        var b = max(x, y)
        var r = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }
}


let number  = Fraction(numerator: 1, denominator: 2)
let number1 = Fraction(decimal: 0.75)
let number3 = Fraction(numerator: 2, denominator: 3)

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
print(number[0]?.description)
print(number[1]?.description)

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


let result = number ~~ number3 * number

print(result.descriptionObject)





