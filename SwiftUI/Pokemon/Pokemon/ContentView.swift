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
        List(pokemons) { pokemon in
            Text(pokemon.name)
            
        }
        .onAppear() {
            guard pokemons.isEmpty else { return }
            let cover: PokemonCover = .init(indexImage: 1)
            let pokemon = Pokemon(name: "Pikachu", cover: cover)
            pokemons.append(pokemon)
            //TODO: First API fetch
        }
    }
}

#Preview {
    ContentView()
}
