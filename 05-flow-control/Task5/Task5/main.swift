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

func calculate() {
    let operands = input()
    print("please select an operator:\n minus \"-\"\n plus \"+\"\n multiplication \"*\"\n raise a power \"^\"")
    let operation = readLine()!
    
    switch operation {
    case "-":
        let result = operands[0] - operands[1]
        print("\(operands[0]) - \(operands[1]) = \(result)")
        
    case "+":
        let result = operands[0] + operands[1]
        print("\(operands[0]) + \(operands[1]) = \(result)")
        
    case "*":
        let result = operands[0] * operands[1]
        print("\(operands[0]) * \(operands[1]) = \(result)")
        
    case "^":
        var result = operands[0]
        for i in 0..<operands[1] - 1 {
            result *= operands[0]
        }
        print("number \(operands[0]) raised by power of \(operands[1]) = \(result)")
        
    default:
        print("wrong operator")
    }

    
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

calculate()
