import UIKit
import Foundation

//1. Опишіть масив fibArray з десяти перших чисел Фібонначі (можна згенерувати або ж використати hardcode).
var fibArray = [0, 1]

for i in 0..<8 {
    fibArray.append(fibArray[i] + fibArray[i + 1])
}

print(fibArray)

//2. Створіть масив revArray, елементи якого знаходяться в оберненому порядку відносно масиву fibArray. Зробіть реверсію масива кількома способами
var revArray = fibArray
revArray.reverse()
print(revArray)

for i in 0..<revArray.count {
    revArray.insert(revArray.removeLast(), at: i)
}

print(revArray)

//3. Створіть масив shuffledArray, елементи якого перемішані відносно масиву fibArray. Використайте мінімально можливу операцію для виконання цього пункту. (завдання на логіку)
var shuffledArray = fibArray.shuffled()
fibArray

//4. Опишіть масив простих чисел snglArray, які не перевищують число 100.
var snglArray = [Int]()

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

for number in 0..<100 {
    if isPrime(number) {
        snglArray.append(number)
    }
}
print(snglArray)

//5. Виведіть на екран кількість елементів масиву snglArray.
print("snglArray has \(snglArray.count) elements")

//6. Виведіть на екран 10-й елемент масив snglArray.
print(snglArray[9])

//7. Виведіть на екран підмасив елементів масиву snglArray, починаючи з 15-го та закінчуючи 20-м елементами.
print(snglArray[14...19])

//8. Створіть масив rptArray з 10 елементів, що рівні 10-му елементу масиву snglArray.
var rptArray = Array(repeating: snglArray[9], count: 10)

//9. Опишіть масив непарних чисел oddArray (не менших за число 0, та не більших за число 10), використовуючи init(arrayLiteral:).
var oddArray = Array.init(arrayLiteral: 1,3,5,7,9)

//10. Додайте до масиву oddArray число 11.
oddArray.append(11)

//11. Додайте до масиву oddArray числа 15, 17, 19 у якості підмасиву.
oddArray += [15, 17, 19]
//oddArray.insert(contentsOf: [17, 17, 19], at: 1)

//12. Вставте у масив oddArray число 13 на позицію між числами 11 та 15.
oddArray.insert(13, at: 6)

//13. Видаліть елементи масиву oddArray, пичинаючи з 5-го та закінчуючи 8-им (невключно) елементами.
let range = 4..<7
oddArray.removeSubrange(range)
print("oddArray - \(oddArray)")

//14. Видаліть останній елемент масиву oddArray та виведіть його на екран.
print("last value - \(oddArray.removeLast())")

//15. Замініть елементи масиву oddArray, починаючи з 2-го та закінчуючи останнім, на масив з числовими елементами 2, 3, 4.
oddArray.replaceSubrange(1..<oddArray.endIndex , with: [2, 3, 4])

//16. Видаліть елемент масиву oddArray, який рівний числу 3.
oddArray.remove(at: 1)

//17. Виведіть значення, яке визначає, чи міститься число 3 у масиві oddArray.
print(oddArray.contains(3))

//18. Виведіть на екран рядкове представлення масиву oddArray.
print(oddArray.description)


