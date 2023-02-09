//: [Previous](@previous)

import Foundation

// configuration -> urlsession -> urlsessionTask

let configuration = URLSessionConfiguration.default
let session = URLSession(configuration: configuration)

let url = URL(string: "https://api.github.com/users/simplebarnacle")!

let task = session.dataTask(with: url) { data, response, error in
    guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
        print("---> response \(response)")
        return
    }
    
    guard let data = data else { return }
    // data -> GithubProfile
    
    do {
        let decoder = JSONDecoder()
        let profile = try decoder.decode(GithubProfile.self, from: data)
        catch {
            
        }
    }
    
//    let result = String(data: data, encoding: .utf8)
//    print(result)
}

task.resume()

//: [Next](@next)
