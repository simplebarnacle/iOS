//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
let numPublisher = PassthroughSubject<Int, Never>()

let subscription1 = numPublisher
    .map { $0 * 2 }
    .sink { value in
        print("transform value: \(value)")
    }

numPublisher.send(10)
subscription1.cancel()

// Filter
let stringPublisher = PassthroughSubject<String, Never>()

let subscription2 = stringPublisher
    .filter { $0.contains("a") }
    .sink { value in
        print("filtered value: \(value)")
    }
stringPublisher.send("abc")
stringPublisher.send("jack")
stringPublisher.send("yun")

subscription2.cancel()
//: [Next](@next)
