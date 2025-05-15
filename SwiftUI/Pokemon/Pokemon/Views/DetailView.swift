//
//  DetailView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 13/05/25.
//

import SwiftUI

struct DetailView: View {
    var pokemon: Pokemon
    var body: some View {
        HStack {
            Text(pokemon.data.name)
            Text(pokemon.data.type[0])
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
        .padding(8)
        .background(PokemonType(apiType: pokemon.data.type[0]).getColor())
    }
}

#Preview {
    DetailView(
        pokemon: .init(data: .init(
            name: "Bulbasaur",
            type: ["grass"]),
                       cover: .init(indexImage: 1),
                       typeColor: .init(apiType: "grass"))
    )
}
