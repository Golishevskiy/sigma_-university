//
//  Fraction+Subscript.swift
//  Properties
//
//  Created by Petro Golishevskiy on 11.04.2021.
//

import Foundation


extension Fraction {
    
    subscript(index: Int) -> Int? {
        get {
            switch index {
            case 0: return self.numerator
            case 1: return self.denominator
            default:
                return nil
            }
        }
        //        set(newValue) {
        //            guard let value = newValue else { return }
        //            switch index {
        //            case 0:
        //                self.numerator = value
        //            case 1:
        //                self.denominator = value
        //            default:
        //                print("index out of range")
        //            }
        //        }
    }
    
    //    subscript(index: String) -> Double? {
    //        if index == "d" {
    //            return self.toDecimal
    //        } else {
    //            return nil
    //        }
    //    }
}
