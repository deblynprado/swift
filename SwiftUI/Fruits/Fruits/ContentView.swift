//
//  ContentView.swift
//  Fruits
//
//  Created by Pietro Rischi Nunes on 25/02/25.
//
import SwiftUI
struct ContentView: View {
    @State var fruitName: String = ""
    @State var fruits: [String] = []
    @State var result: String = ""
    
    var body: some View {
        VStack {
            TextField("Fruit Name", text: $fruitName)
            
            HStack {
                Button("Add") {
                    fruits.append(fruitName)
                    //Se a fruta existir nao adiciona
                    result = fruits.joined(separator: "\n")
                    fruitName = ""
                }
                
                Button("Remove") {
                    var fruitIndex: Int?
                    for (index, fruit) in fruits.enumerated() {
                        if fruit == fruitName { fruitIndex = index }
                    }
                    if let fruitIndex {
                        fruits.remove(at: fruitIndex)
                    }
                    //mostrar erro para usuario
                    result = fruits.joined(separator: "\n")
                }
            }
            Text(result)
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
