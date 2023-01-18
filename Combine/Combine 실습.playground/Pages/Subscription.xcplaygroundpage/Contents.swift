//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>() // output 타입과 failure 타입을 정의

// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hello")
subject.send("World")

subject.send("Hello for the last time")
//subject.send(completion: .finished)
subscription.cancel()
subject.send("Hello ??")
//: [Next](@next)

