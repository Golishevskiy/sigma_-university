import UIKit
import Foundation

//1. Опишіть сутність (змінну), що містить або не містить ціле десяткове число integerNumber, але не задає значення за замовчування.
var integerNumber: Int?

//2. Опишіть сутність (змінну), що містить або не містить число з плавачою крапкою decimalNumber, але не задає значення за
//замовчування.
var decimalNumber: Double?

//3. Присвойте значення числу integerNumber.
integerNumber = 10

//4. Додайте до числа integerNumber те ж значення, використовуючи increment та (або) decrement оператор.
integerNumber! += integerNumber!

//5. Змініть знак числа на протилежний, використовуючи unary minus або plus оператор.
integerNumber = -integerNumber!

//6. Присвойте значення числу decimalNumber значенням числа integerNumber.
decimalNumber = Double(integerNumber!)

//7. Опишіть сутність pairOfValues, що містить або не містить значення integerNumber та decimalNumber.
var pairOfValues: Double? = Double(integerNumber!) + decimalNumber!

//8. Перевірте, чи містить сутність pairOfValues цілочислове значення та виведіть його, якщо таке значення існує.
if pairOfValues == Double(Int(pairOfValues!)) {
    print(pairOfValues!)
} else {
    print("not Int")
}

//9. Перевірте, чи містить сутність pairOfValues значення, що представлене число з плавачою крапкою, та виведіть його, якщо таке значення існує.
if pairOfValues!.rounded(.up) == pairOfValues!.rounded(.down) {
    print("Int")
} else {
    print("Double")
}

//10. Виведіть значення числа decimalNumber використовуючи optinional binding.
if let decimalNumber = decimalNumber {
    print(decimalNumber)
}
