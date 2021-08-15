//
//  ContentView.swift
//  Catproject
//
//  Created by Karin Prater on 30.07.21.
//

import SwiftUI
import SSSwiftUIGIFView


struct ContentView: View {
    var body: some View {
        VStack {
        Text("Hello, world!")
            .padding()
            
            SwiftUIGIFPlayerView(gifName: "cat1")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
