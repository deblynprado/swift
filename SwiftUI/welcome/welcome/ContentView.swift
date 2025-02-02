//
//  ContentView.swift
//  welcome
//
//  Created by Deblyn Prado on 02/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var userName = ""
    @State private var helloText = "Say Hello"
    @State private var helloMessage: String = String()

    
    
    var body: some View {
        VStack {
            
            TextField("Your Name", text: $userName)
            
            Button("\(helloText)!") {
                helloMessage = "\(helloText) \(userName)"
            }
            
            Text(helloMessage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
