//: [Previous](@previous)

// Transforming operators - Mapping Elements

//map

import Combine
import Foundation

//Example from Apple Documentation
/*
 The following example uses an array of numbers as the source for a collection based publisher. A map(_:) operator consumes each integer from the publisher and uses a dictionary to transform it from its Arabic numeral to a Roman equivalent, as a String. If the map(_:)’s closure fails to look up a Roman numeral, it returns the string (unknown).
 */


let numbers = [5, 4, 3, 2, 1, 0]
let romanNumeralDict: [Int : String] =
   [1:"I", 2:"II", 3:"III", 4:"IV", 5:"V"]

let cancellable = numbers.publisher
    .map { romanNumeralDict[$0] ?? "(unknown)" }
    .sink { print("\($0)", terminator: " ") }



//: [Next](@next)
