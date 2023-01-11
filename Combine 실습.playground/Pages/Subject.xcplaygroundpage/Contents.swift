import Foundation
import Combine

// PassthroughSubject
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("subscription received value: \(value)")
}

relay.send("Hello")
relay.send("World")



// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("") //empty string

variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription received value: \(value)")
}

variable.send("More text")
variable.value // "More text"


// -------------------------


let publisher = ["Here", "we", "go"].publisher

publisher.subscribe(relay)



