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
    
    func addWorker(worker: Worker?) {
        guard let worker = worker else { return }
        let result = interviewDelegate.interview(worker: worker)
        if result {
            workers.append(worker)
            print("added new worker - \(worker.firstName) \(worker.lastName)")
        }
    }
    
    func fireWorker(worker: Worker?) {
        guard let item = worker else { return }
        self.workers.removeAll { (w) -> Bool in
            return item === w
        }
    }
    
    func changeSalary(from worker: Worker?,newSalary: Int) {
        guard let worker = worker else { return }
        self.workers.forEach { (w) -> Void in
            if worker === w {
                w.salary = newSalary
                print("\(w.firstName) salary is changed - \(newSalary)")
            }
        }
    }
    
    func printWorkers() {
        workers.forEach { (item) in
            print(item.firstName + " " + item.lastName)
        }
    }
    
    func search(worker: Worker?) -> Worker? {
        guard let worker = worker else { return nil }
        for w in workers {
            if w === worker {
                return w
            }
        }
        return nil
    }
}
