//
//  RandomImageList.swift
//  RandomImageList
//
//  Created by Karin Prater on 17.08.21.
//

import SwiftUI

struct RandomImageList: View {
    
    @ObservedObject var imageFetcher: RandomCatImageFetcher
    
    var body: some View {
        ScrollView {
            LazyVStack {
            
                ForEach(imageFetcher.images) { image in
                ImageCell(image: image)
                    .padding()
//
//                AsyncImage(url: URL(string: image.url)) { image in
//                    image.resizable().scaledToFit()
//                } placeholder: {
//                    Text("Loading")
//                }

                
//                AsyncImage(url: URL(string: image.url)) { phase in
//                    if let image = phase.image {
//                        image // Displays the loaded image.
//                            .resizable()
//                            .scaledToFit()
//                    } else if phase.error != nil {
//                       // Color.red // Indicates an error.
//                        Text(phase.error!.localizedDescription)
//                            .foregroundColor(.red)
//                        
//                    } else {
//                        ProgressView()
//                            .frame(height: 200)
//                        
//                    }
//                }
            }
           
            Color.gray.frame(height: 200)
                .onAppear {
                    print("fetch more")
                    imageFetcher.fetchImages()
                }
                
            }
            
        }
       
           
    }
}
//
//struct RandomImageList_Previews: PreviewProvider {
//    static var previews: some View {
//        RandomImageList()
//    }
//}
