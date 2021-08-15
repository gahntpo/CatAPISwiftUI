//
//  ContentView.swift
//  DesignProject
//
//  Created by Karin Prater on 05.10.20.
//

import SwiftUI

struct ContentView: View {
    
    let text = "Hello, world!"
    
    var body: some View {
        
        VStack {
            TitleView(text: text)
            
            TestButton()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("iPhone 11")
                .previewDevice("iPhone 11")
            
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
        }
    }
}




