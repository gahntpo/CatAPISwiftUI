//
//  APIServiceProtocol.swift
//  APIServiceProtocol
//
//  Created by Karin Prater on 20.08.21.
//

import Foundation


protocol APIServiceProtocol {
    func fetchBreeds(url: URL?, completion: @escaping(Result<[Breed], APIError>) -> Void)
}
