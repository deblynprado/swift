//
//  ContentView.swift
//  Average
//
//  Created by Deblyn Prado on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter New Name", text: $name)
                .border(.black)
            
            Button("New Name") {
                
            }
            Text(name)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
