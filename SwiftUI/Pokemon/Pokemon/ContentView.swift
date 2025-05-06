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
                Text(pokemon.name)
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
            let cover: PokemonCover = .init(indexImage: 4)
            let pokemon = Pokemon(name: "Pikachu", cover: cover)
            pokemons.append(pokemon)
        }
    }
}

#Preview {
    ContentView()
}
