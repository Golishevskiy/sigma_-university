import UIKit
import Foundation

//1. Опишіть множину chSet із символів а, b, c та d.
let chSet: Set<Character> = ["a", "b", "c", "d"]

//2. Створіть mutable множину mChSet на основі множини chSet.
var mChSet = chSet

//3. Виведіть на екран кількість елементів множини mChSet.
print("mChSet has - \(mChSet.count) items")

//4. Вставте символ е в множину mChSet.
mChSet.insert("e")

//5. Створіть множину srtChSet, яка є відсортованою версією множини mChSet.
var srtChSet = mChSet.sorted()

//6. Видаліть з множини mChSet символ f та виведіть видалений символ на екран.
let removedItem = mChSet.remove("f")

if let removed = removedItem {
    print("removed item - \(removed)")
} else {
    print("character does not exist in mChSet")
}

//7. Видаліть символ d з множини mChSet за його індексом та виведіть рядкове представлення множини mChSet.
let index = mChSet.index(mChSet.startIndex, offsetBy: 3)
mChSet.remove(at: index)
print(mChSet.description)

//8. Виведіть відстань у множині mChSet між першим елементом та символом а.
//mChSet.distance(from: mChSet.startIndex, to: mChSet.index)

//9. Вставте символ а в множину mChSet.
mChSet.insert("а")

//10. Опишіть множини aSet (зі значеннями One, Two, Three, 1, 2) та bSet (зі значеннями 1, 2, 3, One, Two).
var aSet: Set = ["One", "Two", "Three", "1", "2"]
var bSet: Set = ["1", "2", "3", "One", "Two"]

//11. Створіть множину, яка містить всі спільні елементи для множин aSet та bSet.
let intersection = aSet.intersection(bSet)

//12. Створіть множину, яка містить унікальні елементи у множині aSet по відношенню до множини bSet. Створіть множину, яка містить унікальні елементи у множині bSet по відношенню до множини aSet.
let aSetSubtracting = aSet.subtracting(bSet)
let bSetSubtracting = bSet.subtracting(aSet)

//13. Створіть множину, яка містить елементи, які не є спільними для множин aSet та bSet.
let symmetricDifference = aSet.symmetricDifference(bSet)

//14. Створіть множину, яка об'єднує усі елементи множин aSet та bSet.
let union = aSet.union(bSet)

//15. Опишіть множини xSet (зі значеннями 2...4), ySet (зі значеннями 1...6), zSet (зі значеннями 3, 4, 2) та x1Set (зі значеннями 5, 6, 7).
var xSet: Set = [2, 3, 4]
var ySet: Set = [1, 2, 3, 4, 5, 6]
var zSet: Set = [3, 4, 2]
var x1Set: Set = [5, 4, 7]

//16. Виведіть значення, які визначають чи множина xSet входить у множину ySet, а також чи множина ySet входить у множину xSet.
xSet.isSubset(of: ySet)
ySet.isSubset(of: xSet)

//17. Виведіть значення, які визначають чи множина xSet містить множину ySet, а також чи множина ySet містить множину xSet.
xSet.isSuperset(of: ySet)
ySet.isSuperset(of: ySet)

//18. Виведіть значеня, яке визначає чи множини xSet та zSet є рівними.
xSet == zSet

//19. Виведіть значення, яке визначає чи множина xSet входить у множину zSet, але не є рівною множині zSet.
xSet.isSubset(of: zSet) && xSet != zSet

//20. Виведіть значення, яке визначає чи множина xSet містить множину zSet, але не є рівною множині zSet.
xSet.isSuperset(of: zSet) && xSet != zSet
