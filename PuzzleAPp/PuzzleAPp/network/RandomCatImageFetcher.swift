//
//  RandomCatImageFetcher.swift
//  RandomCatImageFetcher
//
//  Created by Karin Prater on 16.08.21.
//

import Foundation

class RandomCatImageFetcher: ObservableObject {
    
    @Published var images = [BreedImage]()
    @Published var error: String? = nil
    
    init() {
//        fetchImages()
    }
    
    
    func fetchImages() {
        let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=9")!

        let task = URLSession.shared.dataTask(with: url) { [unowned self] (data , response, error) in
             let decoder = JSONDecoder()
            if let data = data,  let file = String(data: data, encoding: .utf8) {
//                print(file)
                do {
                    let images = try decoder.decode([BreedImage].self, from: data)
                 
                    DispatchQueue.main.async {
                        self.images = self.images + images
                        
                    }
                   
                    
                }catch {
                    print(error)
                }
            }
        }

        task.resume()

    }
}
