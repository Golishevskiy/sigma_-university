import UIKit
import Foundation
/*
 1. Визначити та вивести на екран довжину рядка.
 2. Замінити кожне входження символа “i” на символ “u”.
 3. Видалити 4-й, 7-й та 10-й символи.
 4. Додати рядок “ (modified)” до існуючого рядка.
 5. Вивести значення, що визначає чи існуючий рядок є пустим.
 6. Додати символ “.” до кінця існуючого рядка.
 7. Вивести значення, що визначає чи рядок починається з підрядка
 “Hello”.
 8. Вивести значення, що визначає чи рядок закінчується підрядком
 “world.”
 9. Вставити символ “-“ після 10-го символа.
 10.Замінити послідовність “Thus us” послідовністю “It is”
 11.Вивести 10-й та 15-й симоли існуючого рядка.
 12.Вивести підрядок, що знаходиться у межах 10-го (включно) та 15-
 го (невключно) символів.
 13.Створіть рядок і змінну яка посилається на рядок, виведіть
 адреси обох змінних
 14.Повторіть операцію 13 але створивши substring рядка як 2-гу
 змінну.
 */

var greeting = "Hello World. This is Swift programming language"

//1
print(greeting.count)

//2
var newGreeting = ""
for char in greeting {
    if char == "i" {
        newGreeting.append("u")
    } else {
        newGreeting.append(char)
    }
}
greeting = newGreeting
print(greeting)

//3
func removeChar(strLine: String, n: Int) -> String {
    let count = strLine.count
    var newSringLine = strLine
    let index = strLine.index(strLine.startIndex, offsetBy: n)
    if  count > 0
    {
        newSringLine.remove(at: index)
    }
    return newSringLine
}

greeting = removeChar(strLine: greeting, n: 3)
greeting = removeChar(strLine: greeting, n: 5)
greeting = removeChar(strLine: greeting, n: 7)

greeting = "Hello World. This is Swift programming language"

//4
let someString = "someString"
greeting = greeting + " " + someString

//5
greeting.isEmpty

//6
greeting.append(".")

//7
greeting.hasPrefix("Hello")

//8
greeting.hasSuffix("world.")

//9
let indexItem = greeting.index(greeting.startIndex, offsetBy: 10)
greeting.insert("-", at: indexItem)

//10
let replaced = greeting.replacingOccurrences(of: "Thus us", with: "It is")

//11
print(Array(greeting)[9])
print(Array(greeting)[14])

//12
let start = greeting.index(greeting.startIndex, offsetBy: 9)
let end = greeting.index(greeting.startIndex, offsetBy: 14)
let range = start...end

let newString = String(greeting[range])
print(newString)

//13
var line = "Hello"
var copyLine = line

print(Unmanaged<AnyObject>.passUnretained(line as AnyObject).toOpaque())
print(Unmanaged<AnyObject>.passUnretained(copyLine as AnyObject).toOpaque())

//14
line.removeFirst()
print(Unmanaged<AnyObject>.passUnretained(line as AnyObject).toOpaque())




