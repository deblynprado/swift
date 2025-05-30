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
    var backgroundColor: Color {
        if let type = detail?.types.first?.type.name {
            return PokemonType(apiType: type).color
        } else {
            return Color.white
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(pokemon.data.name)
                Text("# \(detail?.order ?? 0)")
            }

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
        .frame(maxWidth: .infinity, maxHeight: 200)
        .padding(8)
        .background(backgroundColor)
        
        VStack {
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
            
            VStack {
                Text("About")
                    .foregroundColor(backgroundColor)
                    .bold()
                
                HStack {
                    VStack {
                        Text("Weight")
                        Text("\(detail?.weight ?? 0)")
                    }
                    
                    
                    VStack {
                        Text("Height")
                        Text("\(detail?.height ?? 0)")
                    }
                    
                    VStack {
                        Text("Moves")
                        ForEach(detail?.abilities.map(\.ability.name) ?? [], id: \.self) { abilityString in
                            Text(abilityString)
                            
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .padding(10)
        .onAppear {
            Task {
                do {
                    detail = try await Network.shared.fetchDetail(name: pokemon.data.name)
                } catch {
                    
                }
            }
        }
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
