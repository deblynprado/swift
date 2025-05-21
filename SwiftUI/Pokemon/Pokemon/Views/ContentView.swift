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
        
        NavigationStack {
            List(pokemons) { pokemon in
                ZStack {
                    NavigationLink(String()) {
                        DetailView(pokemon: pokemon)
                    }
                    .opacity(0)
                    PokemonCard(pokemon: pokemon)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .onAppear() {
                guard pokemons.isEmpty else { return }
                Task {
                    do {
                        let pokemonsData = try await Network.shared.fetchPokemons()
                        pokemons = pokemonsData.enumerated().map { (index, data) in
                            Pokemon(data: data, cover: .init(indexImage: index + 1), typeColor: .init(apiType: "grass"))
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
