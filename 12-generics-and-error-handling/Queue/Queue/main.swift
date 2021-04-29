//
//  main.swift
//  Queue
//
//  Created by Petro Golishevskiy on 22.04.2021.
//

import Foundation

print("---------queue----------")
let queue = Queue<Int>()

// мати можливіть додати об’єкт
queue.add(new: 1)
queue.add(new: 2)
queue.add(new: 3)
queue.add(new: 4)
queue.add(new: 5)

// мати можливість повернути всю колекцію об’єктів
_ = queue.tasks

// мати можливість повернути об’єкт
let task1 = queue.get()
let task2 = queue.get()

// мати можливість повернути к-ть об’єктів
_ = queue.count

// відповідати принципу FIFO
do {
    try queue.start()
} catch {
    print("Error - \(error)")
}

print("---------queueStr----------")
let queueStr = Queue<String>()

// мати можливіть додати об’єкт
queueStr.add(new: "one")
queueStr.add(new: "two")
queueStr.add(new: "three")
queueStr.add(new: "four")
queueStr.add(new: "five")

// мати можливість повернути всю колекцію об’єктів
let allTasks = queueStr.tasks
print(allTasks)

// мати можливість повернути об’єкт
_ = queueStr.get()

// мати можливість повернути к-ть об’єктів
_ = queueStr.count

// відповідати принципу FIFO
do {
    try queueStr.start()
} catch {
    print("Error - \(error)")
}

print("---------queueCustom----------")
let queueCustom = Queue<Task>()

// мати можливіть додати об’єкт
queueCustom.add(new: Task(name: "Task 1"))
queueCustom.add(new: Task(name: "Task 2"))
queueCustom.add(new: Task(name: "Task 3"))
queueCustom.add(new: Task(name: "Task 4"))
queueCustom.add(new: Task(name: "Task 5"))

// мати можливість повернути всю колекцію об’єктів
let allCustomTasks = queueCustom.tasks
print(allCustomTasks)

// мати можливість повернути об’єкт
_ = queueCustom.get()

// мати можливість повернути к-ть об’єктів
_ = queueCustom.count

// відповідати принципу FIFO
do {
    try queueCustom.start()
} catch {
    
}

//4. Використайте будь-яке обмеження для зберігаємого типу об’єкта та
//продемонструйте це на прикладі.

//let queueDouble = Queue<Double>()

