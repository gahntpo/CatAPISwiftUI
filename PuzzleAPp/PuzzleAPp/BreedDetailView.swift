//
//  BreedDetailView.swift
//  BreedDetailView
//
//  Created by Karin Prater on 17.08.21.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat = 300
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                if breed.image?.url != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: imageSize)
                            .clipped()
    //                        .ignoresSafeArea()
                    } placeholder: {
                        
                        ProgressView()
                            .frame(height: imageSize)
                            .background(Color(.lightGray))
                    }
                    
                    .overlay(alignment: .bottomTrailing) {
                        Button {
                            
                        } label: {
                            Image(systemName: "square.grid.3x3")
                        }
                        .padding()
                        .foregroundColor(.white)

                    }
                    
                }else {
                    Color(.lightGray)
                        .frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(breed.name)
                        .font(.headline)
                    
                    Text(breed.temperament)
                        .font(.caption)
                    
                    Text(breed.breedExplaination)
                    
                    Text("is hairless: \(breed.isHairless ? "YES" : "NO")")
                    
                    HStack {
                        Text("Energy level")
                        Spacer()
                        ForEach(1..<6) { id in
                            Image(systemName: "heart.fill")
                                .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray )
                        }
                    }
                    
                    
                    Spacer()
                }.padding()
                
                    .navigationBarItems(trailing: Button(action: {
                        
                    }, label: {
                        Image(systemName: "star.fill")
                    }))
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example())
    }
}
