//
//  DetailView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 13/05/25.
//

import SwiftUI

struct DetailView: View {
    var pokemon: Pokemon
    @State var detail: DetailDTO?
    
    var body: some View {
        VStack {
            Text(pokemon.data.name)
            Text(detail?.types.first?.type.name ?? "")
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
                ForEach(detail?.types.map(\.type.name) ?? [], id: \.self) { typeString in
                    Text(typeString)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(PokemonType(apiType: typeString).getColor())
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .onAppear {
            Task {
                do {
                    detail = try await Network.shared.fetchDetail(name: pokemon.data.name)
                } catch {
                    
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(8)
        .background(PokemonType(apiType: detail?.types.first?.type.name ?? "").getColor())
    }
}

#Preview {
    DetailView(
        pokemon: .init(data: .init(
            name: "Bulbasaur",
//            types: ["grass", "poison"]
        ),
                       cover: .init(indexImage: 1),
                       typeColor: .init(apiType: "grass")),
        detail: nil
    )
}
