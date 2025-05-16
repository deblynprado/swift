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
//            Text(pokemon.data.types[0])
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
            
            HStack(spacing: 8) {
//                ForEach(pokemon.data.types, id: \.self) { typeString in
//                    Text(typeString)
//                        .font(.caption)
//                        .fontWeight(.medium)
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 4)
//                        .background(PokemonType(apiType: typeString).getColor())
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
//        .background(PokemonType(apiType: pokemon.data.types[0]).getColor())
    }
}

#Preview {
    DetailView(
        pokemon: .init(data: .init(
            name: "Bulbasaur",
//            types: ["grass", "poison"]
        ),
                       cover: .init(indexImage: 1),
                       typeColor: .init(apiType: "grass"))
    )
}
