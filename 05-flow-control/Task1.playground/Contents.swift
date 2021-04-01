import UIKit

func factorial(ofNumber n: Int) -> Int {
    var result = 1
    for i in 1...n {
        result = result * i
        print(result)
    }
    return result
}

factorial(ofNumber: 10)
