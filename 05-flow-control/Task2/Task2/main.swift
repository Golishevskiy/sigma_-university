//
//  main.swift
//  Task2
//
//  Created by Petro Golishevskiy on 27.03.2021.
//

import Foundation

// bubbleSort
func bubbleSort(anArray array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    var sorted = array
    var iteration = sorted.count - 1

    while iteration > 0 {
        for i in 0..<iteration {
            if sorted[i] > sorted[i+1] {
                (sorted[i], sorted[i+1]) = (sorted[i+1], sorted[i])
            }
        }
        iteration = iteration - 1
    }
    return sorted
}

//selectionSort
func selectionSort(anArray array: [Int]) -> [Int] {
    var sorted = array
    guard sorted.count >= 2 else { return sorted }
    
    for current in 0..<(sorted.count - 1) {
        var lowest = current
        for other in (current + 1)..<sorted.count {
            if sorted[lowest] > sorted[other] {
                lowest = other
            }
        }
        if lowest != current {
            (sorted[lowest], sorted[current]) = (sorted[current], sorted[lowest])
        }
    }
    return sorted
}

func sort(anArray array: [Int], withMethod method: Int) {
    // 1 - bubble
    // 2 - selection
    switch method {
    case 1:
        print("sorted by bubble")
        print(bubbleSort(anArray: array))
    case 2:
        print("sorted by selection")
        print(selectionSort(anArray: array))
    default:
        print("Wrong input.\n Select sort method:\n 1 - bubble\n 2 - selection")
    }
}

sort(anArray: [10, 4, 45, 10, 3534, 332, 322], withMethod: 2)
