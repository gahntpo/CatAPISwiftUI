//: [Previous](@previous)

import Foundation

/*
 {
   "userId": 1,
   "id": 1,
   "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
   "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
 }
 */


struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}


//let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!


let task = URLSession.shared.dataTask(with: url) { data, response, error in
    
    let decoder = JSONDecoder()
    if let data = data{
        
        do {
           let posts = try decoder.decode([Post].self, from: data)
            print("found \(posts.count) posts")
        } catch {
            print(error)
        }
        
       
    }
    
    
}

task.resume()





//: [Next](@next)
