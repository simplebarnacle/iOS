//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
let words = "hey there hey there wow ??"
    .components(separatedBy: " ")
    .publisher
words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)


// compactMap

let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// ignoreOutput

let numbers = (1...10_000).publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completion With: \($0)")}, receiveValue: {print($0)})
    .store(in: &subscriptions)


// prefix

let tens = (1...10).publisher

tens
  .prefix(7)
  .sink(receiveCompletion: { print("Completed with: \($0)") },
        receiveValue: { print($0) })
  .store(in: &subscriptions)




//: [Next](@next)
