import UIKit

//1. Опишіть словник nDict, ключами якого є числові рядкові предсталення чисел від 1 до 5, а відповідними значеннями є рядкові представлення чисел від 1 до 5 на англійській мові (наприклад, 1:”One”).
let nDict = ["1": "One", "2" : "Twoo", "3" : "Three", "4" : "Four", "5" : "Five"]

//2. Виведіть на екран значення словника nDict за ключем 3.
if let value = nDict["3"] {
    print(value)
} else {
    print("this index does not contain a value")
}

//3. Виведіть на екран значення словника nDict за індексом ключа 4.
if let index = nDict.index(forKey: "4") {
    print(nDict[index].value)
} else {
    print("this index does not exist")
}

//4. Створіть mutable словник mNDict на основі словника nDict.
var mNDict = nDict

//5. Додайте елементи 6:”Seven” та 7:”Six” до словника mNDict.
mNDict["6"] = "Six"
mNDict["7"] = "Seven"

//6. Оновіть значення елементів словника mNDict, не використовуючи subscript [], до наступних: 6:”Six”, 7:”Seven”, 8:”Eight”.
mNDict.updateValue("Six", forKey: "6")
mNDict.updateValue("Seven", forKey: "7")
mNDict.updateValue("Eight", forKey: "8")

//7. Видаліть елемент за ключем 5 зі словника mNDict.
mNDict.removeValue(forKey: "5")

//8. Видаліть елемент за індексом ключа 4 зі словника mNDict.
if let index = mNDict.index(forKey: "4") {
    mNDict.remove(at: index)
} else {
    print("this index does not exist")
}

//9. Визначіть та виведіть на екран відстань у словнику mNDict між парами значень 1:”One” та 7:”Seven”.
var firstIndex = mNDict.index(forKey: "7")
var secondIndex = mNDict.index(forKey: "1")

if firstIndex != nil && secondIndex != nil {
    if firstIndex! < secondIndex! {
        mNDict.distance(from: firstIndex!, to: secondIndex!)
    } else {
        mNDict.distance(from: secondIndex!, to: firstIndex!)
    }
} else {
    print("index out of range")
}

//10. Створіть масив mNDictKeys, елементами якого є усі ключі словника mNDict.
var mNDictKeys = [String](mNDict.keys)

//11. Створіть масив mNDictKeys, елементами якого є усі значення словника mNDict.
var mNDictValue = [String](mNDict.values)

//12. Виведіть на екран кількість елементів словника mNDict, а також кількість його всіх ключів та його всіх значень.
print("number of items \(mNDict.count)")
print("number of keys \(mNDict.keys.count)")
print("number of value \(mNDict.values.count)")

//13. Виведіть на екран рядкове представлення словника mNDict.
print(mNDict.description)
