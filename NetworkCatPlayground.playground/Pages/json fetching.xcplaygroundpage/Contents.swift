import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//let url = URL(string: "https://www.apple.com")!
let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=1")!

var request = URLRequest(url: url)
request.httpMethod = "GET"
//request.allHTTPHeaderFields = ["x-api-key": "API_key"]

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
        print(response.statusCode)
        //TODO: throw error
    }
    if let error = error {
        print(error.localizedDescription)
    }
    
    if let data = data,
        let file = String(data: data, encoding: .utf8) {
        print(file)
      
    }
    PlaygroundPage.current.finishExecution()
}

task.resume()

