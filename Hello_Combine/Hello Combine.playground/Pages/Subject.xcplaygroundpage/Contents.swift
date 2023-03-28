import Foundation
import Combine

// PassthroughSubject

let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("Received Value : \(value)")
}

relay.send("Hello")

// CurrentValueSubject

let variable = CurrentValueSubject<String, Never>("")
variable.send("IOS_DEV_SKY")
variable.value
let subscription2 = variable.sink { value in
    print("Received Value : \(value)")
}
variable.send("HI")
variable.value



