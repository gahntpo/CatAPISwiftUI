//
//  PuzzelView.swift
//  PuzzelView
//
//  Created by Karin Prater on 16.08.21.
//

import SwiftUI

struct PuzzelView: View {
    let image = Image(uiImage: UIImage(named: "image1")!)
    
    let totalNumber: Int = 25
    
    var numberOfColumns: Int {
        Int(Double(totalNumber).squareRoot())
    }
    
    let gridItems = Array(repeating: GridItem(.flexible(minimum: 100, maximum: 400), spacing: 0), count: 5)

                            
    var body: some View {
        
        VStack {
            ZStack {
                image
                    .resizable()
                    .scaledToFit()
                
                
                LazyVGrid(columns: gridItems, spacing: 0) {
                    ForEach(0..<totalNumber - 1) { idx in
                        PuzzlePiece(image: image,
                                   number: idx,
                                   totalNumber: totalNumber)
                    }
                    
                }
                        
//                VStack(spacing: 0) {
//
//                    ForEach(0...2, id: \.self) { row in
//                        HStack(spacing: 0) {
//                            ForEach(0...2, id: \.self) { column in                            PuzzlePiece(image: image,
//                                          number: row * numberOfColumns + column,
//                                          totalNumber: 9)
//                            }
//                        }
//
//                    }
//
//                    ForEach(0...numberOfColumns - 1, id: \.self) { row in
                                        
//
//                        HStack(spacing: 0) {
//                            ForEach((numberOfColumns * row)...((numberOfColumns + 1) * row - 1),
//                                    id: \.self) { id in
//                                PuzzlePiece(image: image,
//                                            number: id, totalNumber: 9)
//                            }
//                        }
//
//                    }
//
                    
//                    HStack(spacing: 0) {
//                        ForEach(0...2, id: \.self) { id in
//                            PuzzlePiece(image: image,
//                                        number: id, totalNumber: 9)
//                        }
//                    }
//                    HStack(spacing: 0) {
//                        ForEach(3...5, id: \.self) { id in
//                            PuzzlePiece(image: image,
//                                        number: id, totalNumber: 9)
//                        }
//                    }
//                    HStack(spacing: 0) {
//                        ForEach(6...8, id: \.self) { id in
//                            PuzzlePiece(image: image,
//                                        number: id, totalNumber: 9)
//                        }
//                    }
                }
                
                
//            }
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                ForEach(0...totalNumber - 1, id: \.self) { id in
                    PuzzlePiece(image: image,
                                number: id, totalNumber: totalNumber)
                }
                }
                
                
            }.frame(height: 200)
        }
        
    }
}

struct PuzzelView_Previews: PreviewProvider {
    static var previews: some View {
        PuzzelView()
    }
}
