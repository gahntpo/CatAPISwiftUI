//
//  PuzzlePiece.swift
//  PuzzlePiece
//
//  Created by Karin Prater on 16.08.21.
//

import SwiftUI

struct PuzzlePiece: View {
    let image: Image
    let number: Int
    let totalNumber: Int
    
    var numberPerRow: CGFloat {
        CGFloat(totalNumber).squareRoot()
    }
    
    var rowIndex: CGFloat {
       CGFloat( (Double(number) / Double(numberPerRow)).rounded(.towardZero))
    }
    
    var columnIndex: CGFloat {
       CGFloat( (number) % Int(numberPerRow ))
    }
    
    var halfWidth: CGFloat {
        1 / numberPerRow / 2
        
    }
    
    var anchorWidth: CGFloat {
        if columnIndex < (numberPerRow - 1) / 2 {
           return (columnIndex * 2) * halfWidth
        } else if columnIndex < numberPerRow / 2  {
            return 0.5
        }else {
           return (columnIndex * 2 + 2)  * halfWidth
        }
        
    }
    
    var anchorHeight: CGFloat {
        if rowIndex < (numberPerRow - 1)  / 2 {
           return (rowIndex * 2) * halfWidth
        } else if rowIndex < numberPerRow / 2 {
            return 0.5
        }else {
           return (rowIndex  * 2 + 2) * halfWidth
        }
        
    }
    
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .opacity(0.5)
            .scaleEffect(numberPerRow, anchor: UnitPoint(x: anchorWidth,
                                                         y: anchorHeight))
           
            .clipped()
        //    .clipShape(RectanglePart(number: number, totalNumber: totalNumber))
            .border(Color.red)
            .overlay(Text("\(number)  \(columnIndex) \(rowIndex)  -- \(halfWidth)"))
            
        
    }
}

struct PuzzlePiece_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        PuzzlePiece(image: Image(uiImage: UIImage(named: "image1")!),
                    number: 3, totalNumber: 9)
            PuzzlePiece(image: Image(uiImage: UIImage(named: "image1")!),
                        number: 4, totalNumber: 9)
            PuzzlePiece(image: Image(uiImage: UIImage(named: "image1")!),
                        number: 5, totalNumber: 9)
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}


struct RectanglePart: Shape {
    let number: Int
    let totalNumber: Int
    var numberPerRow: Int {
        Int(Double(totalNumber).squareRoot())
    }
    
    var rowIndex: CGFloat {
       CGFloat( (Double(number) / Double(numberPerRow)).rounded(.toNearestOrEven))
    }
    
    var columnIndex: CGFloat {
        CGFloat( number % totalNumber )
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.width / CGFloat(numberPerRow) * columnIndex,
                                  y: 0))
            path.addLine(to: CGPoint(x: rect.width,
                                     y: 0))
            path.addLine(to: CGPoint(x: rect.width,
                                     y: rect.height / CGFloat(numberPerRow) * rowIndex))
            
            path.addLine(to: CGPoint(x: rect.width / CGFloat(numberPerRow) * columnIndex,
                                     y: rect.height / CGFloat(numberPerRow) * rowIndex))
        }
    }
}
