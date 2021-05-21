//
//  ContentView.swift
//  H4X0R
//
//  Created by Marcio Silva on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {
                post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fectchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
