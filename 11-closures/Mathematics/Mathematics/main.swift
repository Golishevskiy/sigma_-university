//
//  main.swift
//  Mathematics
//
//  Created by Petro Golishevskiy on 15.04.2021.
//

import Foundation

class Mathematics {
    
    // 1. Написати функцію applyKTimes яка приймає integer K і замкнення та
    //викликає замкнення К разів. Замкнення не приймає жодних параметрів
    //і повертає пусте значення.
    func applyKTimes(k: Int, completion: () -> Void) {
        for _ in 0..<k {
            completion()
        }
    }
    
    // 3. Написати функцію forEach(array: [Int], _ closure: Int -> ()) яка приймає
    //масив integers і замкнення і виконує замкнення на кожному елементі масиву
    func forEach(array: [Int], closure: (Int) -> Void) {
        for i in array {
            closure(i)
        }
    }
}

let math = Mathematics()
let array = ["hello", ", ", "my ", "name ", "is ", "Swift"]

// 2. Написати функцію об’єднання strings з масиву в один рядок
//використавши reduce
var res = array.reduce("") { $0 + $1 }
print(res)

math.applyKTimes(k: 5) {
    print("print from closure")
}

math.forEach(array: [1, 3, 5, 22]) { (value) in
    print(value)
}

/*
 4. Ознайомитися з функціями map, compactMap, flatMap, reduce.
 Описати декілька прикладів використовування кожної функції.
 */
// map
print("-------------map--------------")
let arrayInt = [1, 12, 3, 44, 128]

let newArrayInt = arrayInt.map { (value) -> Int in
    return value + 1
}
print(newArrayInt)

let newArrayInt1 = array.map { $0 + "!"}
print(newArrayInt1)

let dictionary = ["one" : 1, "two" : 2, "thre" : 3, "four" : 4]
let arrayFromKeys = dictionary.map { ($0, Double($1)) }
print(arrayFromKeys)


// compactMap
print("-------------compactMap--------------")

let strArray = ["1", "two", "3", "4", "five"]
let resultStr = strArray.compactMap { Int($0)}
print(resultStr)

// flatMap
print("-------------flatMap--------------")

let results = [[5,2,7], [4,8], [9,1,3]]
let allResults = results.flatMap { (a: [Int]) -> [Int] in
    return a
}
print(allResults)

let number = [1, 2, 3, 4]
let flatMapped = number.flatMap { (value) -> [Int] in
    return Array(repeating: value, count: value)
}
print(flatMapped)

// reduce
print("-------------reduce--------------")

let numbers = [2, 4, 5, 7]
let total = numbers.reduce(1, *)
print(total)

var string = ["this", "is", "a", "string"]
let newString = string.reduce(into: "") { (result, value) in
    return result += value
}
print(newString)














