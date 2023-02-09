//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>()



// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Subscriber received value : \(value)")
}

subject.send("HELLO")
subject.send("AGAIN")
//subject.send(completion: .finished)
subscription.cancel()
subject.send("BYE")
//: [Next](@next)
