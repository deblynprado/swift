//
//  ContentView.swift
//  imc
//
//  Created by Deblyn Prado on 18/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TextField("Peso", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            TextField("Altura", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
        }
        .padding()
        
        VStack {
            Button("Calcular") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
        }
    }
}

#Preview {
    ContentView()
}
