//
//  main.swift
//  Task5
//
//  Created by Petro Golishevskiy on 28.03.2021.
//

import Foundation

/*
 Створити функцію, яка приймає два числа-операнди та функцію-
 операцію і повертає результат її виконання над операндами.
 
 Реалізувати підтримку наступних дій над числами: додавання,
 віднімання, множення, операція остачі від ділення, піднесення до
 степеня (не використовуючи вбудовних математичних функцій Swift,
 наприклад power). Реалізувати меню вибору функції-операції, у якому
 звертання до основної функції-калькулятора є забороненим. Реалізація
 виконання математичних операцій не потребує користувацького вводу з
 клавіатури - все виконується послідовно. Від користувача очікується
 лише введення вхідних даних.
 */

func calculate(operands: () -> [Int], operator: ([Int]) -> Int) {
    let operand = operands()
    operators(operand: operand)
}

func input() -> [Int] {
    var array = [Int]()
    print("write first value and press enter:")
    let firstValue =  readLine()
    print("write second value and press enter:")
    let secondValue =  readLine()
    
    if let firstValue = firstValue {
        if Int(firstValue) != nil {
            array.append(Int(firstValue)!)
        }
    }
    
    if let secondValue = secondValue {
        if Int(secondValue) != nil {
            array.append(Int(secondValue)!)
        }
    }
    
    return array
}

func operators(operand: [Int]) -> Int{
    
    print("please select an operator:\n minus \"-\"\n plus \"+\"\n multiplication \"*\"\n raise a power \"^\"")
    let operation = readLine()!
    
    switch operation {
    case "-":
        let result = operand[0] - operand[1]
        print("\(operand[0]) - \(operand[1]) = \(result)")
        return result
    case "+":
        let result = operand[0] + operand[1]
        print("\(operand[0]) + \(operand[1]) = \(result)")
        return result
    case "*":
        let result = operand[0] * operand[1]
        print("\(operand[0]) * \(operand[1]) = \(result)")
        return result
    case "^":
        var result = operand[0]
        for _ in 0..<operand[1] - 1 {
            result *= operand[0]
        }
        print("number \(operand[0]) raised by power of \(operand[1]) = \(result)")
        return result
    default:
        print("wrong operator")
        return 0
    }
}

calculate(operands: input, operator: operators(operand:))
