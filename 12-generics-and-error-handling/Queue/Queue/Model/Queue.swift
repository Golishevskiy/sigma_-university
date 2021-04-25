//
//  Queue.swift
//  Queue
//
//  Created by Petro Golishevskiy on 22.04.2021.
//

import Foundation

enum MyError: Error {
    case QueueIsEmpty
}

class Queue<T> where T: CustomTask {
    var tasks = [T]()
    var count: Int {
        get {
            print("Queue has \(tasks.count) tasks")
            return tasks.count
        }
    }
    
    func add(new task: T) {
        self.tasks.append(task)
        print("add task \(task)")
    }
    
    func get() -> T?  {
        guard !tasks.isEmpty else { return nil }
        let removedTask = tasks.remove(at: 0)
        print("task \(removedTask) is finished and deleted")
        return removedTask
    }
    
    func start() throws { 
        guard !tasks.isEmpty else { throw MyError.QueueIsEmpty }
        get()
        try? start()
    }
}


