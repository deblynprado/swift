//
//  ContentView.swift
//  Pokemon
//
//  Created by Deblyn Prado on 29/04/25.
//

import SwiftUI

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

let pokemonRed = UIColor(hex: "#EF5350ff")

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        HStack {
            Text("PokeApi")
                .foregroundStyle(Color(.white))
        }
        .background(Color(pokemonRed ?? .red))
        
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
