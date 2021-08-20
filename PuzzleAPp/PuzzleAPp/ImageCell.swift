//
//  ImageCell.swift
//  ImageCell
//
//  Created by Karin Prater on 16.08.21.
//

import SwiftUI

struct ImageCell: View {
    let image: BreedImage
    
    @StateObject private var headerLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            if headerLoader.image != nil {
                Image(uiImage: headerLoader.image!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .shadow(color: Color(.sRGB, white: 0, opacity: 0.65), radius: 10, x: 0, y: 10)
                
            } else {
                ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.gray)
                    .frame(height: 200)
                    .shadow(radius: 10, x: 0, y: 10)
                 ProgressView()
                }
            }
        }
       
            .onAppear {
                if let url = image.url {
                headerLoader.load(url: url)
                }
            }
    }
}

struct ImageCell_Previews: PreviewProvider {
    static var previews: some View {
        ImageCell(image: BreedImage(height: 100, id: "1", url: "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg", width: 100))
    }
}
