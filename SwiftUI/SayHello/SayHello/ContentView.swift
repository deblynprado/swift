//
//  ContentView.swift
//  SayHello
//
//  Created by Deblyn Prado on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String
    @State var age: Int
    var body: some View {
        VStack {
            TextField("Name", $name)
            TextField("Age", $age)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
