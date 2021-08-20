//
//  ImageLoader.swift
//  MoviePlayer
//
//  Created by Karin Prater on 04.08.21.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    var url: String = ""
    
    func load(url: String) {
        self.url = url
        
        guard let imageURL = URL(string: url) else {
            self.errorMessage = "Sorry, we could not find the image you are looking for."
            return
        }
        isLoading = true
        
        let request = URLRequest(url: imageURL, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 5)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data, error == nil else {
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error?.localizedDescription
                }
                return
            }

            let image = UIImage(data: data)
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }

        }.resume()
        
    }
    
    
    
}
