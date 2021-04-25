//
//  String+Name.swift
//  Queue
//
//  Created by Petro Golishevskiy on 24.04.2021.
//

import Foundation

extension String: CustomTask {
    var name: String {
        return "Task \(self.description)"
    }
}
