//
//  SwiftUIView.swift
//  SSSwiftUIGIFView
//
//  Created by Vatsal Tanna on 07/01/20.
//

import SwiftUI

public struct SwiftUIGIFPlayerView: UIViewRepresentable {
    
    private var gifName: String?
    private var assetName: String?
    
    public init(gifName: String) {
        self.gifName = gifName
    }
    
    public init(assetName: String) {
        self.assetName = assetName
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwiftUIGIFPlayerView>) {
        
    }
    
    public func makeUIView(context: Context) -> UIView {
        if let name = gifName {
            return GIFPlayerView(gifName: name)
        }else if let assetName = assetName {
            return GIFPlayerView(assetsImage: assetName)
        }else {
            return UIView()
        }
        
    }
    
}
