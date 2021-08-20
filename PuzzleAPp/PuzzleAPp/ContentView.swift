//
//  ContentView.swift
//  PuzzleAPp
//
//  Created by Karin Prater on 16.08.21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var imageFetcher = RandomCatImageFetcher()
    @StateObject var breedFetcher = BreedFetcher()
    
    @State private var selection = 2
    var body: some View {

//        TabView(selection: $selection) {
//            RandomImageList(imageFetcher: imageFetcher)
//                .tag(1)
//                .tabItem {
//                    Text("Random Cat")
//                }
//
            Group {
                if breedFetcher.breeds.count > 0 {
                    BreedListView(breedFetcher: breedFetcher)
                    
                    
                } else  {
                    Text("Loading")
                }
            }
//            .tag(2)
//                .tabItem {
//                    Text("Cat breeeds")
//                }
//            
//            
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
