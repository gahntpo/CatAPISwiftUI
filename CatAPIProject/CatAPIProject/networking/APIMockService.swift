//
//  APIMockService.swift
//  APIMockService
//
//  Created by Karin Prater on 20.08.21.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<[Breed], APIError>
    
    func fetchBreeds(url: URL?, completion: @escaping (Result<[Breed], APIError>) -> Void) {
        completion(result)
    }
    
    
    
    
}
