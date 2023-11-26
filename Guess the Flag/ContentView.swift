//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Dylan Silva on 11/26/23.
//
// introduting stacks, images, buttons, alerts, assets catalogs and more
// guess the flag
//entails: many flages, guessing which flag goes to which country, show correct and incorrect


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
