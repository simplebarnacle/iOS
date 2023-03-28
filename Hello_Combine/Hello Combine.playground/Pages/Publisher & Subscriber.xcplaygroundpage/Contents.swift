//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber

let justPublisher = Just(1000) // 데이터를 한번 전송하고 끝
let subscription = justPublisher.sink { value in
    print("Received value : \(value)")
}


let arrayPublisher = [1,3,5,7,9,].publisher
let subscription2 = arrayPublisher.sink { value in
    print("Received value : \(value)")
}

class MyClass {
    var property: Int = 0 {
        didSet {
            print("Did set property \(property)")
        }
    }
}

let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print("Final Value: \(object.property)")
//object.property = 3

//: [Next](@next)


