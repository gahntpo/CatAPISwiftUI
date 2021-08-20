//
//  BreedFetcher.swift
//  BreedFetcher
//
//  Created by Karin Prater on 16.08.21.
//

import Foundation


class BreedFetcher: ObservableObject {
    
    @Published var breeds = [Breed]()

    //TODO:
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        fetchBreeds()
        
      print(URLCache.shared.memoryCapacity) //half a megabyte
        
        URLCache.shared.memoryCapacity = 512 * 1024 * 1024
    }
    
    func fetchBreeds() {
        
        // no force unwrapping
        //networkService with unit testing
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!

        let task = URLSession.shared.dataTask(with: url) { [unowned self] (data , response, error) in
            
            let decoder = JSONDecoder()
            if let data = data,  let file = String(data: data, encoding: .utf8) {
//                print(file)
                do {
                    let breeds = try decoder.decode([Breed].self, from: data)
//                    print(breeds)
                    DispatchQueue.main.async {
                        self.breeds = breeds
                    }
                   
                    
                }catch {
                    print(error)
                }
            }
        }

        task.resume()
    }
    
    static func preview() -> BreedFetcher {
        let fetcher = BreedFetcher()
        fetcher.breeds = [Breed(name: "Abyssinian", id: "abys",
                                description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
                                temperament: "Active, Energetic, Independent, Intelligent, Gentle", energyLevel: 3),
                          Breed(name: "Aegean", id: "aege", description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.", temperament: "Affectionate, Social, Intelligent, Playful, Active", energyLevel: 5)]
        
        
        return fetcher
    }
}
