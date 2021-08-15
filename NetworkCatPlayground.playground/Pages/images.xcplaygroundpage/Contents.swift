//: [Previous](@previous)

import Foundation
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://cdn2.thecatapi.com/images/bq1.jpg")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    if let data = data, let image = UIImage(data: data) {
        print("success")
        let i = image
    }
    
    PlaygroundPage.current.finishExecution()
}

task.resume()

//: [Next](@next)
