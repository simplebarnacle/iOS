//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber
let justPublisher = Just(1000)
let subscription1 = justPublisher.sink { value in
    print("Received Value: \(value )")
}

print("")

let arrayPublisher = [1, 3, 5, 7, 9].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received Value: \(value )")
}

print("")

class Myclass {
    var property: Int = 0 {
        didSet {
            print("Did set property to \(property)")
        }
    }
}


let object = Myclass()
let subscription3 = arrayPublisher.assign(to: \.property , on: object)
print("Final value \(object.property)")





//: [Next](@next)


