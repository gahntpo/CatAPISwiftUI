//
//  ErrorTestView.swift
//  DesignProject
//
//  Created by Karin Prater on 06.10.20.
//

import SwiftUI

struct ErrorTestView: View {
    
    var body: some View {
        
        VStack {
            Text("item 1")
            Text("item 2")
            Text("item 3")
            Text("item 4")
            Text("item 5")
            
            VStack {
            Text("item 6")
            Text("item 7")
            Text("item 8")
            Text("item 9")
            Text("item 10")
            }
            
            Text("item 11")
            Text("item 12")
        }
    }
}

struct ErrorTestView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorTestView()
    }
}
