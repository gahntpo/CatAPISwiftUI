//
//  ContentView.swift
//  DesignMacProject
//
//  Created by Karin Prater on 06.10.20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
    
            TitleView(text: "this is a mac project")
            Text("Hello, World!")
               
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
