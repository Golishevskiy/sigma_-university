//
//  main.swift
//  Task1
//
//  Created by Petro Golishevskiy on 20.03.2021.
//

import Foundation

//1.1

let hello = "Hello, World!"
print(hello)
print("______________________")

//1.3
print("Please enter your name: ", terminator: "")
var inputName = ""
let name = readLine()

if let name = name {
    inputName = name
}

print("\(hello) \(inputName)")
print("______________________")

//1.4

enterNumber()

func enterNumber() {
    print("Please enter 1 or 2: ", terminator: "")
    var didSelect = String()
    
    if let selected = readLine() {
        didSelect = selected
    }

    switch didSelect {
    case "1": print("\(inputName) \(hello)")
    case "2": print("\(hello) \(inputName)")
    default:
        print("Attention. Enter only 1 or 2!")
        enterNumber()
    }
}



