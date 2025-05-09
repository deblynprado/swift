//
//  ContentView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        Header()
        
        List(pokemons) { pokemon in
            HStack {
                Text(pokemon.data.name)
                AsyncImage(
                    url: pokemon.cover.image,
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 100)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
        }
        .onAppear() {
            guard pokemons.isEmpty else { return }
            Network().fetchList { pokemonsData in
                pokemons = pokemonsData.enumerated().map { (index, data) in
                    Pokemon(data: data, cover: .init(indexImage: index + 1))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
