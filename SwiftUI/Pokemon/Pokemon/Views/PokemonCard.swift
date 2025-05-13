//
//  PokemonCard.swift
//  Pokemon
//
//  Created by Deblyn Prado on 13/05/25.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
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
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(.blue)
        .cornerRadius(16)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    PokemonCard(pokemon: .init(data: .init(name: "Pikachu"), cover: .init(indexImage: 1)))
}
