//
//  Fraction+Subscript.swift
//  Properties
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation


extension Fraction {
    subscript(index: String) -> Int? {
        get {
            switch index {
            case "n": return self.numerator
            case "m": return self.denominator
            default:
                return nil
            }
        }
        set(newValue) {
            guard let value = newValue else { return }
            switch index {
            case "n":
                self.numerator = value
            case "m":
                self.denominator = value
            default:
                print("index out of range")
            }
        }
    }
    
    subscript(index: String) -> Double? {
        if index == "d" {
            return self.toDecimal
        } else {
            return nil
        }
    }
}
