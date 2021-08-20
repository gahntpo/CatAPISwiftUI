//
//  BreedRow.swift
//  BreedRow
//
//  Created by Karin Prater on 17.08.21.
//

import SwiftUI

struct BreedRow: View {
    let breed: Breed
    
    let imageSize: CGFloat = 100
    var body: some View {
        HStack {
            if breed.image?.url != nil {
                AsyncImage(url: URL(string: breed.image!.url!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .clipped()
                } placeholder: {
                    
                    ProgressView()
                        .frame(width: imageSize, height: imageSize)
                        .background(Color(.lightGray))
                }
            }else {
                Color(.lightGray)
                    .frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name).font(.headline)
                Text(breed.temperament)
                
                
            }
            
        }
    }
}

struct BreedRow_Previews: PreviewProvider {
    static var previews: some View {
        BreedRow(breed: Breed.example())
    }
}
