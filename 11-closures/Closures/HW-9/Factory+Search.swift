//
//  Factory+Search.swift
//  HW-9
//
//  Created by Petro Golishevskiy on 17.04.2021.
//

import Foundation

extension Factory {
    func search(workerType: TypeWorker, completion: (Worker) -> Void) {
        self.workers.forEach { (worker) in
            if worker.type == workerType {
                completion(worker)
            }
        }
    }
    
    func search(for name: String, completion: (Worker?) -> Void) {
        for worker in self.workers {
            if worker.firstName == name {
                completion(worker)
                return
            }
        }
        completion(nil)
    }
}

