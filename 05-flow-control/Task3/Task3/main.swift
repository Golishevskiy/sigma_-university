//
//  main.swift
//  Task3
//
//  Created by Petro Golishevskiy on 27.03.2021.
//

import Foundation

/*Створити функцію, яка аналізує вхідний символ на його
 належність до літер або цифр, належність до літер англійської чи
 української абеток, належність до літер великого або малого регістрів.
 Результатом виконання функції є результати аналізу. Функція повинна
 здійснювати зрозумілий користувачу вивід на екран результатів аналізу.
 */

func checkSymbol(fromUser char: Character)  {
    var result = "\(char) is:"
    let en = "abcdefghijklmnopqrstuvwxyz"
    let ua = "абвгґдеєжзиіїйклмнопрстуфхцчшщьюя"
    
    if char.isNumber {
        result += "\n number"
    }
    if char.isSymbol {
        result += "\n symbol"
    }
    if char.isLetter {
        result += "\n letter"
    }
    if char.isUppercase {
        result += "\n uppercase"
    }
    if char.isLowercase {
        result += "\n lowercase"
    }
    if char.isCurrencySymbol {
        result += "\n currency symbol"
    }
    if char.isWhitespace {
        result = "your symbol is space"
    }
    if char.isPunctuation {
        result += "\n punctuation symbol"
    }
    if en.contains(char) || en.uppercased().contains(char) {
        result += "\n EN language"
    }
    if ua.contains(char) || ua.uppercased().contains(char) {
        result += "\n UA language"
    }
    print(result)
}

checkSymbol(fromUser: readLine()?.first ?? " ")
