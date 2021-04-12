//
//  Factory.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation

class Factory {
    var workers: [Worker]
    var director: Director
    var interviewDelegate: Interview
    
    init(workers: [Worker], director: Director) {
        self.workers = workers
        self.director = director
        self.interviewDelegate = director
    }
    
    func addWorker(worker: Worker) {
        let result = interviewDelegate.interview(worker: worker)
        
        if result == true {
            workers.append(worker)
            print("added new worker - \(worker.firstName) \(worker.lastName)")
        }
    }
    
    func fireWorker(worker: Worker) {
        for (index, item) in workers.enumerated() {
            if item.firstName == worker.firstName && item.lastName == worker.lastName {
                workers.remove(at: index)
                print("\(item.firstName) \(item.lastName) is fired")
            }
        }
    }
    
    func changeSalary(from worker: Worker,newSalary: Int) {
        for (index, item) in workers.enumerated() {
            if item.firstName == worker.firstName && item.lastName == worker.lastName {
                workers[index].salary = newSalary
                print("\(item.firstName) salary is changed - \(newSalary)")
            }
        }
    }
    
    func printWorkers() {
        workers.forEach { (item) in
            print(item.firstName + " " + item.lastName)
        }
    }
    
    func search(worker: Worker) -> Worker? {
        for item in workers {
            if item === worker {
                return item
            }
        }
        return nil
    }
}
