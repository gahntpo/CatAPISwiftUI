//
//  TtitleView.swift
//  DesignProject
//
//  Created by Karin Prater on 05.10.20.
//

import SwiftUI

struct TitleView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.bold)
           // .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
           
    }
}

struct TtitleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleView(text: "hello")
                .previewLayout(.fixed(width: 200.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            
            TitleView(text: "hello")
                .environment(\.sizeCategory, .accessibilityExtraLarge)
                .previewLayout(.fixed(width: 200.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            
            TitleView(text: "hello")
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
                .previewLayout(.fixed(width: 200.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
        }
    }
}
