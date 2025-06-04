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
    let gaugeMin = 0
    let gaugeMax = 255
    var backgroundColor: Color {
        if let type = detail?.types.first?.type.name {
            return PokemonType(apiType: type).color
        } else {
            return Color.white
        }
    }
    
    enum StatTypes: String {
        case hp = "hp"
        case attack = "attack"
        case defense = "defense"
        case specialAttack = "special-attack"
        case specialDefense = "special-defense"
        case speed = "speed"
        
        var displayStatName: String {
            switch self {
            case .hp:
                return "hp"
            case .attack:
                return "atk"
            case .defense:
                return "dfs"
            case .specialAttack:
                return "satk"
            case .specialDefense:
                return "sdef"
            case .speed:
                return "spd"
                
            }
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
                            Text("\(abilityString)")
                            
                        }
                    }
                }
                
                VStack {
                    Text("Base Stats")
                        .foregroundColor(backgroundColor)
                    
                    ForEach(detail?.stats ?? [], id: \.stat.name) { stat in
                        HStack {
                            Text(stat.stat.name)
                            Spacer()
                            Text("\(stat.base_stat)")
                            Gauge(value: Double(stat.base_stat), in: Double(gaugeMin)...Double(gaugeMax)) {}
                            .accentColor(backgroundColor)
                            }
                        .textCase(.uppercase)
                        .foregroundColor(backgroundColor)
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
