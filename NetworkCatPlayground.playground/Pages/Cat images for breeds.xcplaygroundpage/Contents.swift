//: [Previous](@previous)

import Foundation

struct Breed: Codable {
    let id: String
    let name: String
    let temperament: String
}

struct BreedImage: Codable {
    let breeds: [Breed]
    let height: Int
    let id: String
    let url: String
    let width: Int
}


let selectedCatBreedId = "abys"
let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=9&breed_id=\(selectedCatBreedId)")!

let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    let decoder = JSONDecoder()
    
    if let data = data {
        
        do {
            let images = try decoder.decode([BreedImage].self, from: data)
            print("success, fetched \(images.count) image urls")
        } catch {
            print(error)
        }
    }
    
    
}

task.resume()


//: [Next](@next)
